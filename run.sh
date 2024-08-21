#!/usr/bin/bash
tmux new -s "mobile" -d
tmux send-keys -t "mobile" 'cd ./unibg_mobile_and_cloud_2024-main/mytedx && flutter run && tmux kill-session' C-m
tmux attach -t "mobile"

