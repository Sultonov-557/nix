{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.inputs.home-manager.follows = "home-manager";

    nixcord.url = "github:kaylorben/nixcord";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      preCommit = inputs.pre-commit-hooks.lib.${system};
      preCommitCheck = preCommit.run {
        src = ./.;
        hooks = {
          nixfmt-rfc = {
            enable = true;
          };
          deadnix = {
            enable = true;
          };

          no-hw-commit = {
            enable = true;
            entry = "bash -c 'if git diff --cached --name-only | rg -x hardware-configuration.nix; then echo Error: hardware-configuration.nix is not allowed to be committed. >&2; exit 1; fi'";
            language = "system";
            pass_filenames = false;
          };
        };
      };
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = { inherit inputs; };
          modules = [
            ./configuration.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                backupFileExtension = "backup";
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit inputs;
                };
                users.sultonov =
                  { pkgs, ... }:
                  {
                    imports = [
                      ./home.nix
                      inputs.dankMaterialShell.homeModules.dankMaterialShell.default
                      inputs.zen-browser.homeModules.beta
                      inputs.nixcord.homeModules.nixcord
                      inputs.nix-flatpak.homeManagerModules.nix-flatpak
                    ];
                  };
              };
            }
          ];
        };
      };

      checks.${system}.pre-commit = preCommitCheck;
      devShells.${system}.default = pkgs.mkShell {
        shellHook = preCommitCheck.shellHook;
      };

      formatter.${system} = pkgs.nixfmt-tree;
    };
}
