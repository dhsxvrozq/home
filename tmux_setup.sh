#!/bin/bash

SESSION="acab"

source /home/john/Scripts/home/.env

# Убиваем предыдущую tmux-сессию
tmux kill-server
sleep 0.05

# Создаем новую сессию в фоне
tmux new-session -d -s $SESSION

# Левая верхняя панель (0.0)
tmux send-keys -t $SESSION:0.0 "$SERVER1" C-m

# Разделяем вправо (правая верхняя панель: 0.1)
tmux split-window -h -t $SESSION:0.0
tmux send-keys -t $SESSION:0.1 "$SERVER2" C-m

# Разделяем правую верхнюю вниз (правая нижняя: 0.2)
tmux split-window -v -t $SESSION:0.1
# Можно запустить что-то при желании: tmux send-keys -t $SESSION:0.2 "$SERVER4" C-m

# Возвращаемся к левой верхней и делим её вниз (левая нижняя: 0.3)
tmux select-pane -t $SESSION:0.0
tmux split-window -v -t $SESSION:0.0

# tmux select-pane -t $SESSION:0.2
tmux send-keys -t $SESSION:0.1 "$SERVER3" C-m


# tmux send-keys -t $SESSION:0.2 'echo "Панель 3"; sleep 10' C-m

# # Делим вторую панель горизонтально
# tmux select-pane -t $SESSION:0.1
# tmux split-window -v -t $SESSION:0.1
# tmux send-keys -t $SESSION:0.3 'echo "Панель 4"; sleep 10' C-m

# # Выбираем первую панель
# tmux select-pane -t $SESSION:0.0

# # Подключаемся к сессии
tmux attach -t $SESSION
