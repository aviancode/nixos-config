{ pkgs }:
{
  rebuild = pkgs.writeShellApplication {
    name = "rebuild";
    runtimeInputs = [ pkgs.git ];
    text = ''
      exec sudo nixos-rebuild switch --flake "$(git -C "$PWD" rev-parse --show-toplevel 2>/dev/null || pwd)#desktop" "$@"
    '';
  };
}
