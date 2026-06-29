# Melange palette
set -l c_bg 292522
set -l c_selection_text 1c1b19
set -l c_selection fce8c3
set -l c_fg ECE1D7
set -l c_dim 867462
set -l c_red BD8183
set -l c_red_bright D47766
set -l c_green 78997A
set -l c_green_bright 85B695
set -l c_yellow E49B5D
set -l c_yellow_bright EBC06D
set -l c_blue 7F91B2
set -l c_blue_bright A3A9CE
set -l c_magenta B380B0
set -l c_magenta_bright CF9BC2
set -l c_cyan 7B9695
set -l c_cyan_bright 89B3B6
set -l c_tan C1A78E

set --global fish_color_autosuggestion $c_dim
set --global fish_color_cancel $c_red_bright
set --global fish_color_command $c_green_bright
set --global fish_color_comment $c_dim
set --global fish_color_cwd $c_blue_bright
set --global fish_color_cwd_root $c_red_bright
set --global fish_color_end $c_cyan_bright
set --global fish_color_error $c_red_bright
set --global fish_color_escape $c_magenta_bright
set --global fish_color_gray $c_dim
set --global fish_color_history_current --bold
set --global fish_color_host $c_green_bright
set --global fish_color_host_remote $c_cyan_bright
set --global fish_color_keyword $c_blue
set --global fish_color_normal $c_fg
set --global fish_color_operator $c_cyan
set --global fish_color_option $c_yellow_bright
set --global fish_color_param $c_tan
set --global fish_color_quote $c_magenta_bright
set --global fish_color_redirection $c_cyan_bright
set --global fish_color_search_match --foreground=$c_selection_text --background=$c_yellow_bright
set --global fish_color_selection --foreground=$c_selection_text --background=$c_selection
set --global fish_color_status $c_red_bright
set --global fish_color_user $c_yellow_bright
set --global fish_color_valid_path --underline=single

set --global fish_pager_color_background
set --global fish_pager_color_completion $c_fg
set --global fish_pager_color_description $c_dim
set --global fish_pager_color_prefix $c_cyan_bright
set --global fish_pager_color_progress $c_dim
set --global fish_pager_color_secondary_background
set --global fish_pager_color_secondary_completion $c_tan
set --global fish_pager_color_secondary_description $c_dim
set --global fish_pager_color_secondary_prefix $c_blue_bright
set --global fish_pager_color_selected_background --background=$c_bg
set --global fish_pager_color_selected_completion $c_fg
set --global fish_pager_color_selected_description $c_dim
set --global fish_pager_color_selected_prefix $c_yellow_bright
