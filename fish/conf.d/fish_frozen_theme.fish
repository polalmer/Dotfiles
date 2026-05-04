# midnight_x palette (synced with nvim/colors/midnightX.lua)
set -l c_bg 1e1e1e
set -l c_fg d2d2d2
set -l c_yellow faf728
set -l c_pink fa2894
set -l c_purple f728fa
set -l c_green 08bf5f
set -l c_cyan 87cefa
set -l c_gray 949494
set -l c_red ff2e2e
set -l c_white e7e7e7

set --global fish_color_autosuggestion $c_gray
set --global fish_color_cancel $c_red
set --global fish_color_command $c_green
set --global fish_color_comment $c_gray
set --global fish_color_cwd $c_yellow
set --global fish_color_cwd_root $c_red
set --global fish_color_end $c_cyan
set --global fish_color_error $c_red
set --global fish_color_escape $c_pink
set --global fish_color_gray $c_gray
set --global fish_color_history_current --bold
set --global fish_color_host $c_green
set --global fish_color_host_remote $c_cyan
set --global fish_color_keyword $c_cyan
set --global fish_color_normal $c_fg
set --global fish_color_operator $c_cyan
set --global fish_color_option $c_yellow
set --global fish_color_param $c_purple
set --global fish_color_quote $c_purple
set --global fish_color_redirection $c_cyan
set --global fish_color_search_match --foreground=$c_bg --background=$c_yellow
set --global fish_color_selection --foreground=$c_bg --background=$c_purple
set --global fish_color_status $c_red
set --global fish_color_user $c_pink
set --global fish_color_valid_path --underline=single

set --global fish_pager_color_background
set --global fish_pager_color_completion $c_fg
set --global fish_pager_color_description $c_gray
set --global fish_pager_color_prefix $c_cyan
set --global fish_pager_color_progress $c_gray
set --global fish_pager_color_secondary_background
set --global fish_pager_color_secondary_completion
set --global fish_pager_color_secondary_description
set --global fish_pager_color_secondary_prefix
set --global fish_pager_color_selected_background --background=$c_bg
set --global fish_pager_color_selected_completion $c_white
set --global fish_pager_color_selected_description $c_gray
set --global fish_pager_color_selected_prefix $c_cyan
