#!/usr/bin/bash

tmux new -s "mobile" -d
tmux send-keys -t "mobile" 'cd ./mobile && flutter run && tmux kill-session' C-m
tmux attach -t "mobile"

#cd ./mobile && flutter run
