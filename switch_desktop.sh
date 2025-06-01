#!/bin/bash
# Получаем общее количество рабочих столов
DESKTOP_COUNT=$(wmctrl -d | wc -l)
# Получаем текущий рабочий стол
CURRENT_DESKTOP=$(wmctrl -d | grep '*' | cut -d' ' -f1)
# Вычисляем предыдущий рабочий стол
PREV_DESKTOP=$(( (CURRENT_DESKTOP - 1 + DESKTOP_COUNT) % DESKTOP_COUNT ))
# Переключаемся на предыдущий рабочий стол
wmctrl -s $PREV_DESKTOP
