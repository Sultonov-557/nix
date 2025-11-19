{ pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.configPackages = [
      (pkgs.writeTextDir "share/wireplumber/main.lua.d/51-disable-noise-suppression.lua" ''
        -- Disable noise suppression and echo cancellation
        rule = {
          matches = {
            {
              { "node.name", "matches", "effect_input.*" },
            },
          },
          apply_properties = {
            ["node.disabled"] = true,
          },
        }
        table.insert(alsa_monitor.rules, rule)
      '')
    ];

    extraConfig.pipewire = {
      "10-disable-filters" = {
        "context.modules" = [
          {
            name = "libpipewire-module-filter-chain";
            args = {
              "audio.format" = "F32";
              "audio.rate" = 48000;
              "node.description" = "Noise Canceling";
              "node.disabled" = true;
            };
          }
        ];
      };
    };
  };
}
