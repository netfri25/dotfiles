#!/bin/bash

DEFAULT_COMPOSITOR=river

COMPOSITOR=${1:-$DEFAULT_COMPOSITOR}
shift

cleanup() {
    # cleanup
    CGROUP_PATH=$(grep "^0::" /proc/self/cgroup | cut -d: -f3)
    pids=$(cat /sys/fs/cgroup"$CGROUP_PATH"/cgroup.procs | tail -n +3 | tac)

    this_pid=$$

    for pid in $pids; do
        if [ "$pid" -ne "$this_pid" ]; then
            kill "$pid" 2>/dev/null || true
        fi
    done
}

trap cleanup EXIT

# dbus
eval $(dbus-launch --sh-syntax)

# keyring
eval $(gnome-keyring-daemon --start --components=ssh,secrets,gpg)

# polkit
/usr/libexec/xfce-polkit &

# env keyring
export SSH_AUTH_SOCK
export GNOME_KEYRING_CONTROL

# other env
export TERMINAL=foot
export XCURSOR_THEME=GoogleDot-Black
export XCURSOR_SIZE=24

# sound
pipewire &

# wm
$COMPOSITOR "$@"
