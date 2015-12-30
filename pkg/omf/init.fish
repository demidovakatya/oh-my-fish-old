function init -a path --on-event init_omf
  set -g OMF_MISSING_ARG   1
  set -g OMF_UNKNOWN_OPT   2
  set -g OMF_INVALID_ARG   3
  set -g OMF_UNKNOWN_ERR   4

  function omf::em
    set_color $fish_color_match ^/dev/null; or set_color cyan
  end

  function omf::dim
    set_color $fish_color_autosuggestion ^/dev/null; or set_color 555
  end

  function omf::under
    set_color --underline
  end

  function omf::err
    set_color $fish_color_error ^/dev/null; or set_color red --bold
  end

  function omf::off
    set_color normal
  end

  autoload $path/cli $path/util

  if set -q __omf_pending_update
    for package in (omf.packages.list --installed)
      omf.update $package
    end

    set -e __omf_pending_update
    refresh
  end

end
