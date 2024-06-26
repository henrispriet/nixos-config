{float-styling, ...}: {
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      settings.defaults = {
        # TODO: configure float size
        # TODO: fused layout
        # https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#fused-layout
        borderchars = let
          box = with float-styling.border.chars; [horizontal vertical horizontal vertical topLeft topRight bottomRight bottomLeft];
        in {
          prompt = box;
          results = box;
          preview = box;
        };
        layout_config = {inherit (float-styling.size) width height;};

        mappings = {
          # close Telescope window with one press of <esc> instead of two
          i = {
            "<esc>".__raw = ''require("telescope.actions").close'';
          };
        };
      };
    };

    # enable telescope borders _in base16-colorscheme_ of all things
    # i mean why, base16-colorscheme? what did telescope borders ever do to you?
    # NOTE: also have to reset the colors because stylix colortheme init comes before nixvim extraConfigLuaPre ;-;
    # otherwise i could just call with_config before setup :(
    extraConfigLuaPre = ''
      require("base16-colorscheme").setup(require("base16-colorscheme").colors, { telescope_borders = true })
    '';
  };
}
