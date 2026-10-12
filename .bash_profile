if [[ -z ${WAYLAND_DISPLAY:-} && "$(tty 2>/dev/null)" == "/dev/tty1" ]]; then
  export XDG_SESSION_TYPE=wayland
  export XDG_CURRENT_DESKTOP=sway
  export QT_QPA_PLATFORM='wayland;xcb'
  export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
  export QT_QPA_PLATFORMTHEME=gtk3
  export MOZ_ENABLE_WAYLAND=1
  export SDL_VIDEODRIVER=wayland
  export _JAVA_AWT_WM_NONREPARENTING=1

  exec sway
fi
