#!/bin/bash

# Скрипт для открытия папки из буфера обмена в VS Code

# Получаем содержимое буфера обмена
CLIPBOARD_CONTENT=$(xclip -selection clipboard -o 2>/dev/null)

# Открываем в VS Code
code "$CLIPBOARD_CONTENT"
