#!/bin/bash

SESSION="acab"

source /home/john/Scripts/home/.env

tmux kill-server
sleep 0.05
# Запускаем новую сессию в фоне
tmux new-session -d -s $SESSION

# В первой панели (окне 0) запускаем команду (например, ssh)
tmux send-keys -t $SESSION:0 "$SERVER1" C-m
# # Делим окно на две панели (вертикально)
tmux split-window -h -t $SESSION:0
tmux split-window -v -t $SESSION:0.1
tmux send-keys -t $SESSION:0.1 "$SERVER2" C-m

# # Делим первую панель горизонтально, чтобы получить сетку 2x2
tmux select-pane -t $SESSION:0.0
tmux split-window -v -t $SESSION:0.0


# tmux send-keys -t $SESSION:0.2 'echo "Панель 3"; sleep 10' C-m

# # Делим вторую панель горизонтально
# tmux select-pane -t $SESSION:0.1
# tmux split-window -v -t $SESSION:0.1
# tmux send-keys -t $SESSION:0.3 'echo "Панель 4"; sleep 10' C-m

# # Выбираем первую панель
# tmux select-pane -t $SESSION:0.0

# # Подключаемся к сессии
tmux attach -t $SESSION
