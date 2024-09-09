{
	description = "Videomass flake example";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = { self, nixpkgs, flake-utils }:
		flake-utils.lib.eachDefaultSystem (system:
		let
			pkgs = import nixpkgs { inherit system; };
		in {
			packages.videomass = pkgs.callPackage ./pkgs/videomass.nix {
				inherit (pkgs) lib python3 fetchPypi ffmpeg;
			};
		});
}

