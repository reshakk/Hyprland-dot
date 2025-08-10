set background=dark

let s:colors_file = expand("~/.cache/wal/colors-wal.vim")

" Проверяем существование файла и загружаем его
if filereadable(s:colors_file)
    execute 'source ' . s:colors_file
else
    " Если файл не найден, используем цвета по умолчанию из вашего примера
    let wallpaper  = "/home/reshkk/.current_wallpaper"
    let background = "#111212"
    let foreground = "#eadbbf"
    let cursor     = "#eadbbf"
    let color0  = "#111212"
    let color1  = "#C5AA7D"
    let color2  = "#7F7E83"
    let color3  = "#A6A3A0"
    let color4  = "#DABC89"
    let color5  = "#C1BFBF"
    let color6  = "#DFC18D"
    let color7  = "#eadbbf"
    let color8  = "#a39985"
    let color9  = "#C5AA7D"
    let color10 = "#7F7E83"
    let color11 = "#A6A3A0"
    let color12 = "#DABC89"
    let color13 = "#C1BFBF"
    let color14 = "#DFC18D"
    let color15 = "#eadbbf"
    echo "Используются цвета по умолчанию"
endif

" Применяем цвета через highlight команды
execute 'hi Normal guifg=' . foreground . ' guibg=' . background
execute 'hi NormalFloat guifg=' . foreground . ' guibg=' . color0
execute 'hi EndOfBuffer guifg=' . background . ' guibg=' . background

" Курсор
execute 'hi Cursor guifg=' . background . ' guibg=' . cursor
execute 'hi CursorLine guibg=' . color0
execute 'hi CursorColumn guibg=' . color0
execute 'hi CursorLineNr guifg=' . foreground . ' guibg=' . background . ' gui=bold'

" Комментарии и строки
execute 'hi Comment guifg=' . color8
execute 'hi String guifg=' . color2
execute 'hi Character guifg=' . color2

" Константы и числа
execute 'hi Constant guifg=' . color3
execute 'hi Number guifg=' . color4
execute 'hi Boolean guifg=' . color4
execute 'hi Float guifg=' . color4

" Идентификаторы и функции
execute 'hi Identifier guifg=' . color1
execute 'hi Function guifg=' . color6

" Ключевые слова
execute 'hi Statement guifg=' . color1
execute 'hi Conditional guifg=' . color1
execute 'hi Repeat guifg=' . color1
execute 'hi Label guifg=' . color1
execute 'hi Operator guifg=' . color5
execute 'hi Keyword guifg=' . color1
execute 'hi Exception guifg=' . color1

" Препроцессор
execute 'hi PreProc guifg=' . color6
execute 'hi Include guifg=' . color6
execute 'hi Define guifg=' . color6
execute 'hi Macro guifg=' . color6
execute 'hi PreCondit guifg=' . color6

" Типы данных
execute 'hi Type guifg=' . color4
execute 'hi StorageClass guifg=' . color4
execute 'hi Structure guifg=' . color4
execute 'hi Typedef guifg=' . color4

" Специальные символы
execute 'hi Special guifg=' . color5
execute 'hi SpecialChar guifg=' . color5
execute 'hi Tag guifg=' . color5
execute 'hi Delimiter guifg=' . color5
execute 'hi SpecialComment guifg=' . color8
execute 'hi Debug guifg=' . color5

" Ошибки и предупреждения
execute 'hi Error guifg=' . foreground . ' guibg=' . color1
execute 'hi ErrorMsg guifg=' . color1 . ' guibg=' . background
execute 'hi WarningMsg guifg=' . color3

" Поиск
execute 'hi Search guifg=' . background . ' guibg=' . color6
execute 'hi IncSearch guifg=' . background . ' guibg=' . color4

" Выделение
execute 'hi Visual guibg=' . color8
execute 'hi VisualNOS guibg=' . color8

" Статус строка
execute 'hi StatusLine guifg=' . foreground . ' guibg=' . color8
execute 'hi StatusLineNC guifg=' . color8 . ' guibg=' . background

" Меню и всплывающие окна
execute 'hi Pmenu guifg=' . foreground . ' guibg=' . color0
execute 'hi PmenuSel guifg=' . background . ' guibg=' . color6
execute 'hi PmenuSbar guibg=' . color8
execute 'hi PmenuThumb guibg=' . color5

" Номера строк
execute 'hi LineNr guifg=' . color8 . ' guibg=' . background
execute 'hi SignColumn guibg=' . background

" Вкладки
execute 'hi TabLine guifg=' . color8 . ' guibg=' . background
execute 'hi TabLineFill guibg=' . background
execute 'hi TabLineSel guifg=' . foreground . ' guibg=' . color0

" Фолдинг
execute 'hi Folded guifg=' . color8 . ' guibg=' . color0
execute 'hi FoldColumn guifg=' . color8 . ' guibg=' . background

" Дифф
execute 'hi DiffAdd guifg=' . color2 . ' guibg=' . background
execute 'hi DiffChange guifg=' . color3 . ' guibg=' . background
execute 'hi DiffDelete guifg=' . color1 . ' guibg=' . background
execute 'hi DiffText guifg=' . background . ' guibg=' . color6

" Дополнительные элементы интерфейса
execute 'hi VertSplit guifg=' . color8 . ' guibg=' . background
execute 'hi WildMenu guifg=' . background . ' guibg=' . color6
execute 'hi Directory guifg=' . color4
execute 'hi Title guifg=' . color6 . ' gui=bold'
execute 'hi Question guifg=' . color2
execute 'hi MoreMsg guifg=' . color2
execute 'hi ModeMsg guifg=' . color2

" Специфичные для Neovim элементы
execute 'hi FloatBorder guifg=' . color8 . ' guibg=' . color0
execute 'hi NormalNC guifg=' . foreground . ' guibg=' . background
