{lib, ...}: {
  programs.nixvim = {
    plugins = {
      # TODO: make highligthing in flash mode better
      # the symbol under the cursor becomes the only one _not_ highlighted
      flash = {
        enable = true;

        modes.search.enabled = true;
        # is default, but doesn't seem to actually work :P
        highlight.groups.current = "IncSearch";
      };

      indent-blankline.enable = true;

      # TODO: finetune pair rules
      # add `<>` and `||` with _correct_ rules (for use in Rust)
      nvim-autopairs.enable = true;

      mini = {
        enable = true;

        modules = {
          comment = {};

          surround = {
            respect_selection_type = true;
            search_method = "cover_or_next";
            silent = true;

            # swaps default behaviour of left bracket and right bracket for all bracket types
            # ok i admit, i had a little fun here...
            custom_surroundings = with lib;
              pipe ["()" "[]" "{}" "<>"]
              [
                (map stringToCharacters)
                (map (pair: {
                  ${head pair} = pair;
                  ${last pair} = pair;
                }))
                (foldl mergeAttrs {})
                (mapAttrs (
                  name: pair: let
                    space = optionalString (name == (last pair)) " ";
                  in {
                    output = {
                      left = (head pair) + space;
                      right = space + (last pair);
                    };
                  }
                ))
              ];
          };
        };
      };
    };
  };
}
