# name: ocean
# A fish theme with ocean in mind.


## Set this options in your config.fish (if you want to)
#set -g theme_display_user yes
#set -g default_user default_username

set __oceanfish_glyph_anchor \u27a4
set __oceanfish_glyph_flag \u2691
set __oceanfish_glyph_radioactive \u2622
set __devecoop_glyph_git_no_dirty \u2713

function _git_branch_name
    echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end


function _is_git_dirty
    echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end


function fish_prompt
    set -l last_status $status
    set -l fuxia (set_color d33682)
    set -l red (set_color red)
    set -l lila (set_color 6c71c4)
    set -l white (set_color white)
    set -l black (set_color black)
    set -l bg_blue (set_color -b blue)
    set -l bg_lila (set_color -b 6c71c4)
    set -l bg_white (set_color -b white)
    set -l bg_red (set_color -b red)
    set -l bg_yellow (set_color -b yellow)
    set -l normal (set_color normal)
    set -l bg_normal (set_color -b normal)
    set -l cwd $white(prompt_pwd)
    set -l uid (id -u $USER)


    # Show a yellow radioactive symbol for root privileges
    if [ $uid -eq 0 ]
        echo -n -s $bg_yellow $black " $__oceanfish_glyph_radioactive " $normal
    end


    # Display virtualenv name if in a virtualenv
    if set -q VIRTUAL_ENV
        echo -n -s $bg_cyan $black " " (basename "$VIRTUAL_ENV") " " $normal
    end


    # Show a nice anchor (turns red if previous command failed)
    if test $last_status -ne 0
        echo -n -s $bg_red $white " $__oceanfish_glyph_anchor "  $normal
    else
        echo -n -s $bg_blue $white " $__oceanfish_glyph_anchor " $normal
    end

    if [ "$theme_display_user" = "yes" ]
        if [ "$USER" != "$default_user" -o -n "$SSH_CLIENT" ]
            echo -n -s $bg_white $cyan " " (whoami) "@" (hostname -s) " " $normal
        end
    end

    # Display current path
    echo -n -s $bg_lila " $cwd " $bg_normal
    echo -n -s $lila ' ' $normal
end
