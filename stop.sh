#!/bin/bash

set -e

function delete_screen_session() {
    for session_id in $(screen -ls | grep ""$1"" | cut -d. -f1 | awk '{print $1}'); do
        screen -S $session_id -X quit || screen -wipe $session_id || true
    done
}

delete_screen_session "v2ray"
delete_screen_session "frp"
