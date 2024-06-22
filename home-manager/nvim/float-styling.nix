rec {
  size = rec {
    scalingFactor = 0.75;
    width.__raw = ''math.floor(vim.o.columns * ${builtins.toString scalingFactor})'';
    height.__raw = ''math.floor(vim.o.lines * ${builtins.toString scalingFactor})'';
  };

  border = let
    # list of possible border styles
    single = {
      name = "single";
      chars = {
        topLeft = "┌";
        horizontal = "─";
        topRight = "┐";
        vertical = "│";
        bottomRight = "┘";
        bottomLeft = "└";
        verticalRight = "┤";
        verticalLeft = "├";
        horizontalBottom = "┴";
        horizontalTop = "┬";
        center = "┼";
      };
    };
    # selected border style
  in
    single;
}
