# name: ocean
# A fish theme with ocean in mind.


## Set this options in your config.fish (if you want to)
# set -g theme_display_user yes
# set -g default_user default_username


function fish_right_prompt
    set -l last_status $status
    set -l magenta (set_color magenta)
    set -l red (set_color red)
    set -l cyan (set_color cyan)
    set -l white (set_color white)
    set -l black (set_color black)
    set -l bg_blue (set_color -b blue)
    set -l bg_cyan (set_color -b cyan)
    set -l bg_white (set_color -b white)
    set -l bg_red (set_color -b red)
    set -l bg_yellow (set_color -b yellow)
    set -l normal (set_color normal)
    set -l cwd $white(prompt_pwd)
    set -l uid (id -u $USER)


    # Show a yellow radioactive symbol for root privileges
    if [ $uid -eq 0 ]
        echo -n -s $bg_yellow $black " $__oceanfish_glyph_radioactive " $normal
    end

    # Show git branch and dirty state
    if [ (_git_branch_name) ]
        echo -n -s '  '
        set -l git_branch (_git_branch_name)
        if [ (_is_git_dirty) ]
            echo -n -s $magenta " $git_branch " $red "$__oceanfish_glyph_flag " $normal
        else
            echo -n -s $magenta " $git_branch " $normal
        end
    end


    # Terminate with a space
    echo -n -s ' ' $normal
end
