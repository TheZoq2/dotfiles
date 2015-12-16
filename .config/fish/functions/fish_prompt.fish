function fish_mode_prompt
end

function printViPrompt
    switch $fish_bind_mode
      case default
        set_color --bold red
        printf '♦'
      case insert
        set_color --bold green
        printf '♦'
      case replace-one
        set_color --bold blue
        printf '♦'
      case visual
        set_color --bold magenta
        printf '♦'
    end
    
    set_color normal
end

function fish_prompt

    set_color 8216a0 --bold
    printf '%s ' (prompt_pwd)

    
    if test -n "$fish_bind_mode"
      #printf '[%s] ' $fish_bind_mode
      printViPrompt
    end

    set_color -o ff0000
    printf ' ➔ '
    set_color normal
end

function fish_right_prompt
  set_color normal
  printf '%s' (__fish_git_prompt)

  printf '%s'(hostname | cut -d . -f 1)
end
