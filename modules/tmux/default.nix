{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
		shortcut = "a";
		baseIndex = 1;
		escapeTime = 0;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 100000;
    plugins = with pkgs;
      [
        {
					plugin = tmuxPlugins.catppuccin;
					extraConfig = '' 
					set -g @catppuccin_flavour 'frappe'
					set -g @catppuccin_window_tabs_enabled on
					set -g @catppuccin_date_time "%H:%M"
					'';
        }
        tmuxPlugins.better-mouse-mode
      ];
    extraConfig = ''
			# https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"

      # Mouse works as expected
      set-option -g mouse on
      # easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
    '';
  };
}
