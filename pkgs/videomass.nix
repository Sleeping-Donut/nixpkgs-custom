{ lib, stdenv, python3, fetchPypi, ffmpeg }:

python3.pkgs.buildPythonApplication rec {
	pname = "videomass";
	version = "5.0.20";
	pyproject = true;

	src = fetchPypi {
		inherit pname version;
		hash = "sha256-YdCbgbR9iM05u0VrTho92OIfL7Y2WCNmYfHeZAk9u54=";
	};

	nativeBuildInputs = with python3.pkgs; [
		setuptools
		hatchling
		build
		wheel
		babel
#		pyinstaller
		twine
	];

	propagatedBuildInputs = with python3.pkgs; [
		ffmpeg # not py3 pkg
		yt-dlp
		wxpython
		pypubsub
	];

	buildInputs = with python3.pkgs; [
	];

	postInstall = ''
		wrapPythonPrograms
	'';

	meta = {
		description = "Videomass is a cross-platform GUI for FFmpeg and yt-dlp";
		homepage = "https://jeanslack.github.io/Videomass/";
		license = lib.licenses.gpl3Only;
		maintainers = with lib.maintainers; [ jeanslack ];
		platforms = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
	};
}
