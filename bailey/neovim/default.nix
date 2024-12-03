{ lib, buildNeovimPlugin, ... }:

buildNeovimPlugin {
  pname = "bailey.nvim";
  version = "2024-08-16";
  src = ./.;
}
