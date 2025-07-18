{
  description = "Rust development template";

  inputs = {
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    naersk = {
      url = "github:nix-community/naersk";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      fenix,
      naersk,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        toolchain = pkgs.rustPlatform;
      in
      rec {
        # Executed by `nix build`
        packages.default =
          let
            pkgs = nixpkgs.legacyPackages.${system};
            target = "TARGET";
            toolchain =
              with fenix.packages.${system};
              combine [
                minimal.cargo
                minimal.rustc
                targets.${target}.latest.rust-std
              ];
          in
          (naersk.lib.${system}.override {
            cargo = toolchain;
            rustc = toolchain;
          }).buildPackage
            {
              src = ./.;
              CARGO_BUILD_TARGET = target;
              CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER =
                let
                  inherit (pkgs.pkgsCross.aarch64-multiplatform.stdenv) cc;
                in
                "{cc}/bin/${cc.targetPrefix}cc";
            };

        # Executed by `nix run`
        apps.default = flake-utils.lib.mkApp { drv = packages.default; };

        # Used by `nix develop`
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            (with toolchain; [
              cargo
              rustc
              rustLibSrc
            ])
            clippy
            rust-analyzer
            rustfmt
            pkg-config
          ];

          # Specify the rust-src path (many editors rely on this)
          RUST_SRC_PATH = "${toolchain.rustLibSrc}";
        };
      }
    );
}
