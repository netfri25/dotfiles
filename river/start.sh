#!/bin/bash

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
eval $(gnome-keyring-daemon --start)

# polkit
/usr/libexec/xfce-polkit &

# env keyring
export SSH_AUTH_SOCK
export GNOME_KEYRING_CONTROL

# sound
pipewire &

# wm
river
