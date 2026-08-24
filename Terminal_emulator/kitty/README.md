убрать пробелы и комментарии
grep -v -E '^[[:space:]]*#|^$' ~/.config/kitty/kitty.conf

темы
kitty +kitten themes
kitty +list-fonts

темы хранятся в ~/.cache/kitty/themes/kitty-themes.zip
который скачивается с https://github.com/kovidgoyal/kitty-themes при первом вызове kitten themes
при выборе темы лучше не заменять ~/.config/kitty/kitty.conf а нажать d (dark)

Управление окнами (Внутренние панели / Сплиты)
Ctrl + Shift + Enter — Открыть новое окно (разделить экран).
Ctrl + Shift + W — Закрыть текущее окно.
Ctrl + Shift + [ — Переключиться на предыдущее окно.
Ctrl + Shift + ] — Переключиться на следующее окно.
Ctrl + Shift + R — Начать изменение размера активного окна.

Управление вкладками (Tabs)
Ctrl + Shift + T — Создать новую вкладку.
Ctrl + Shift + Q — Закрыть текущую вкладку.
Ctrl + Shift + Left — Перейти на левую вкладку.
Ctrl + Shift + Right — Перейти на правую вкладку.
Ctrl + Shift + Alt + T — Переименовать текущую вкладку.

Прокрутка и буфер (Scrollback)
Ctrl + Shift + Up — Прокрутить вверх на одну строку.
Ctrl + Shift + Down — Прокрутить вниз на одну строку.
Ctrl + Shift + PageUp — Прокрутить вверх на страницу.
Ctrl + Shift + PageDown — Прокрутить вниз на страницу.
Ctrl + Shift + H — Открыть весь буфер вывода в текстовом редакторе (например, в vim).

Работа с текстом и экраном
Ctrl + Shift + C — Скопировать выделенный текст в буфер.
Ctrl + Shift + V — Вставить текст из буфера.
Ctrl + Shift + Backspace — Сбросить терминал (очистить экран).
Ctrl + Shift + Equal (=) — Увеличить размер шрифта.
Ctrl + Shift + Minus (-) — Уменьшить размер шрифта.

Перезагрузка конфигурации
Ctrl + Shift + F5 — Применить изменения из kitty.conf без перезапуска терминала.

сдвинуть вкладки
Ctrl+Shift+,
Ctrl+Shift+.

Левый клик: переключение на выбранную вкладку.
Клик колесиком (middle click): закрыть вкладку.
