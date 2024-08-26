#!/usr/bin/bash
cd ./unibg_mobile_and_cloud_2024-main/mytedx || exit
tmux new -s "mobile" -d
tmux send-keys -t "mobile" 'flutter run && tmux kill-session -t mobile' C-m
tmux attach -t "mobile"

