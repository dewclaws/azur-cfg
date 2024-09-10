{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ".." = "cd ..";
      cat = "bat --style=plain --theme=base16 --paging=never ";
      e = "eza ";
      neofetch = "fastfetch";
      sudo = "sudo ";
      v = "vim ";
    };
  };
}
