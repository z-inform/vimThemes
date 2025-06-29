" Vim color file
" Name:       mink.vim
" Maintainer: 
" Homepage:   
"
" This should work in the GUI, rxvt-unicode (88 colour mode) and xterm (256
" colour mode). It won't work in 8/16 colour terminals.
"
" To use a black background, :let g:mink_black_background = 1

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "mink"

" map a urxvt cube number to an xterm-256 cube number
fun! <SID>M(a)
    return strpart("0135", a:a, 1) + 0
endfun

" map a urxvt colour to an xterm-256 colour
fun! <SID>X(a)
    if &t_Co == 88
        return a:a
    else
        if a:a == 8
            return 237
        elseif a:a < 16
            return a:a
        elseif a:a > 79
            return 232 + (3 * (a:a - 80))
        else
            let l:b = a:a - 16
            let l:x = l:b % 4
            let l:y = (l:b / 4) % 4
            let l:z = (l:b / 16)
            return 16 + <SID>M(l:x) + (6 * <SID>M(l:y)) + (36 * <SID>M(l:z))
        endif
    endif
endfun

if ! exists("g:mink_black_background")
    let g:mink_black_background = 0
endif

if has("gui_running")
    if ! g:mink_black_background
        hi Normal         gui=NONE   guifg=#cfbfad   guibg=#1e1e27
    else
        hi Normal         gui=NONE   guifg=#cfbfad   guibg=#000000
    endif

    hi CursorLine         guibg=#2e2e37

    hi IncSearch      gui=BOLD   guifg=#303030   guibg=#cd8b60
    hi Search         gui=NONE   guifg=#303030   guibg=#ad7b57
    hi ErrorMsg       gui=BOLD   guifg=#ffffff   guibg=#ce4e4e
    hi WarningMsg     gui=BOLD   guifg=#ffffff   guibg=#ce8e4e
    hi ModeMsg        gui=BOLD   guifg=#7e7eae   guibg=NONE
    hi MoreMsg        gui=BOLD   guifg=#7e7eae   guibg=NONE
    hi Question       gui=BOLD   guifg=#ffcd00   guibg=NONE

    hi StatusLine     gui=BOLD   guifg=#b9b9b9   guibg=#3e3e5e
    hi User1          gui=BOLD   guifg=#00ff8b   guibg=#3e3e5e
    hi User2          gui=BOLD   guifg=#7070a0   guibg=#3e3e5e
    hi StatusLineNC   gui=NONE   guifg=#b9b9b9   guibg=#3e3e5e
    hi VertSplit      gui=NONE   guifg=#b9b9b9   guibg=#3e3e5e

    hi WildMenu       gui=BOLD   guifg=#eeeeee   guibg=#6e6eaf

    hi MBENormal                 guifg=#cfbfad   guibg=#2e2e3f
    hi MBEChanged                guifg=#eeeeee   guibg=#2e2e3f
    hi MBEVisibleNormal          guifg=#cfcfcd   guibg=#4e4e8f
    hi MBEVisibleChanged         guifg=#eeeeee   guibg=#4e4e8f

    hi DiffText       gui=NONE   guifg=#ffffcd   guibg=#4a2a4a
    hi DiffChange     gui=NONE   guifg=#ffffcd   guibg=#306b8f
    hi DiffDelete     gui=NONE   guifg=#ffffcd   guibg=#6d3030
    hi DiffAdd        gui=NONE   guifg=#ffffcd   guibg=#306d30

    hi Cursor         gui=NONE   guifg=#404040   guibg=#8b8bff
    hi lCursor        gui=NONE   guifg=#404040   guibg=#8fff8b
    hi CursorIM       gui=NONE   guifg=#404040   guibg=#8b8bff

    hi Folded         gui=NONE   guifg=#cfcfcd   guibg=#4b208f
    hi FoldColumn     gui=NONE   guifg=#8b8bcd   guibg=#2e2e2e

    hi Directory      gui=NONE   guifg=#00ff8b   guibg=NONE
    hi LineNr         gui=NONE   guifg=#8b8bcd   guibg=#2e2e2e
    hi NonText        gui=BOLD   guifg=#8b8bcd   guibg=NONE
    hi SpecialKey     gui=BOLD   guifg=#3b205d   guibg=NONE
    hi Title          gui=BOLD   guifg=#af4f4b   guibg=NONE
    hi Visual         gui=NONE   guifg=#eeeeee   guibg=#4e4e8f

    hi Comment        gui=NONE   guifg=#cd8b00   guibg=NONE
    hi Constant       gui=NONE   guifg=#ffcd8b   guibg=NONE
    hi String         gui=NONE   guifg=#ffcd8b   guibg=NONE
    hi Error          gui=NONE   guifg=#ffffff   guibg=#6e2e2e
    hi Identifier     gui=NONE   guifg=#ff8bff   guibg=NONE
    hi Ignore         gui=NONE
    hi Number         gui=NONE   guifg=#f0ad6d   guibg=NONE
    hi PreProc        gui=NONE   guifg=#409090   guibg=NONE
    hi Special        gui=NONE   guifg=#c080d0   guibg=NONE
    hi SpecialChar    gui=NONE   guifg=#c080d0   guibg=NONE
    hi Statement      gui=NONE   guifg=#808bed   guibg=NONE
    hi Todo           gui=BOLD   guifg=#303030   guibg=#d0a060
    hi Type           gui=NONE   guifg=#ff8bff   guibg=NONE
    hi Underlined     gui=BOLD   guifg=#df9f2d   guibg=NONE
    hi TaglistTagName gui=BOLD   guifg=#808bed   guibg=NONE

    hi perlSpecialMatch   gui=NONE guifg=#c080d0   guibg=#404040
    hi perlSpecialString  gui=NONE guifg=#c080d0   guibg=#404040

    hi cSpecialCharacter  gui=NONE guifg=#c080d0   guibg=NONE
    hi cFormat            gui=NONE guifg=#c080d0   guibg=NONE

    hi doxygenBrief                 gui=NONE guifg=#fdab60   guibg=NONE
    hi doxygenParam                 gui=NONE guifg=#fdd090   guibg=NONE
    hi doxygenPrev                  gui=NONE guifg=#fdd090   guibg=NONE
    hi doxygenSmallSpecial          gui=NONE guifg=#fdd090   guibg=NONE
    hi doxygenSpecial               gui=NONE guifg=#fdd090   guibg=NONE
    hi doxygenComment               gui=NONE guifg=#ad7b20   guibg=NONE
    hi doxygenSpecial               gui=NONE guifg=#fdab60   guibg=NONE
    hi doxygenSpecialMultilineDesc  gui=NONE guifg=#ad600b   guibg=NONE
    hi doxygenSpecialOnelineDesc    gui=NONE guifg=#ad600b   guibg=NONE

    if v:version >= 700
        hi Pmenu          gui=NONE   guifg=#eeeeee   guibg=#4e4e8f
        hi PmenuSel       gui=BOLD   guifg=#eeeeee   guibg=#2e2e3f
        hi PmenuSbar      gui=BOLD   guifg=#eeeeee   guibg=#6e6eaf
        hi PmenuThumb     gui=BOLD   guifg=#eeeeee   guibg=#6e6eaf

        hi SpellBad     gui=undercurl guisp=#cc6666
        hi SpellRare    gui=undercurl guisp=#cc66cc
        hi SpellLocal   gui=undercurl guisp=#cccc66
        hi SpellCap     gui=undercurl guisp=#66cccc

        hi MatchParen   gui=NONE      guifg=#cfbfad   guibg=#4e4e8f
    endif
    if v:version >= 703
        hi Conceal      gui=NONE      guifg=#c080d0   guibg=NONE
        hi ColorColumn  gui=NONE                      guibg=#2e2e2e
    endif
else
    if ! g:mink_black_background
        exec "hi Normal         cterm=NONE   ctermfg=" . 254 . " ctermbg=" . 16
    else
        exec "hi Normal         cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(16)
    endif

    exec "hi IncSearch      cterm=BOLD   ctermfg=" . <SID>X(80) . " ctermbg=" . <SID>X(73)
    exec "hi Search         cterm=NONE   ctermfg=" . <SID>X(80) . " ctermbg=" . <SID>X(52)
    exec "hi ErrorMsg       cterm=BOLD   ctermfg=" . <SID>X(16) . " ctermbg=" . <SID>X(48)
    exec "hi WarningMsg     cterm=BOLD   ctermfg=" . <SID>X(16) . " ctermbg=" . <SID>X(68)
    exec "hi ModeMsg        cterm=BOLD   ctermfg=" . <SID>X(38) . " ctermbg=" . "NONE"
    exec "hi MoreMsg        cterm=BOLD   ctermfg=" . <SID>X(38) . " ctermbg=" . "NONE"
    exec "hi Question       cterm=BOLD   ctermfg=" . <SID>X(52) . " ctermbg=" . "NONE"

    exec "hi StatusLine     cterm=BOLD   ctermfg=" . <SID>X(85) . " ctermbg=" . <SID>X(81)
    exec "hi User1          cterm=BOLD   ctermfg=" . <SID>X(28) . " ctermbg=" . <SID>X(81)
    exec "hi User2          cterm=BOLD   ctermfg=" . <SID>X(39) . " ctermbg=" . <SID>X(81)
    exec "hi StatusLineNC   cterm=NONE   ctermfg=" . <SID>X(84) . " ctermbg=" . <SID>X(81)
    exec "hi VertSplit      cterm=NONE   ctermfg=" . <SID>X(84) . " ctermbg=" . <SID>X(81)

    exec "hi WildMenu       cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(38)

    exec "hi MBENormal                   ctermfg=" . <SID>X(85) . " ctermbg=" . <SID>X(81)
    exec "hi MBEChanged                  ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(81)
    exec "hi MBEVisibleNormal            ctermfg=" . <SID>X(85) . " ctermbg=" . <SID>X(82)
    exec "hi MBEVisibleChanged           ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(82)

    exec "hi DiffText       cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(34)
    exec "hi DiffChange     cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(17)
    exec "hi DiffDelete     cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(32)
    exec "hi DiffAdd        cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(20)

    "exec "hi Folded         cterm=NONE   ctermfg=" . 254        . " ctermbg=" . 53
    exec "hi Folded         cterm=NONE   ctermfg=" . 104        . " ctermbg=" . "NONE"
    exec "hi FoldColumn     cterm=NONE   ctermfg=" . <SID>X(39) . " ctermbg=" . <SID>X(80)

    exec "hi Directory      cterm=NONE   ctermfg=" . <SID>X(28) . " ctermbg=" . "NONE"
    exec "hi LineNr         cterm=NONE   ctermfg=" . 55         . " ctermbg=" . <SID>X(80)
    exec "hi NonText        cterm=BOLD   ctermfg=" . <SID>X(39) . " ctermbg=" . "NONE"
    exec "hi SpecialKey     cterm=BOLD   ctermfg=" . <SID>X(55) . " ctermbg=" . "NONE"
    exec "hi Title          cterm=BOLD   ctermfg=" . <SID>X(48) . " ctermbg=" . "NONE"
    exec "hi Visual         cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(38)

    exec "hi Comment        cterm=NONE   ctermfg=" . 67         . " ctermbg=" . "NONE"
    exec "hi Constant       cterm=BOLD   ctermfg=" . 202        . " ctermbg=" . "NONE"
    exec "hi String         cterm=NONE   ctermfg=" . 41         . " ctermbg=" . "NONE"
    exec "hi Error          cterm=NONE   ctermfg=" . 0          . " ctermbg=" . 196
    exec "hi Identifier     cterm=NONE   ctermfg=" . <SID>X(53) . " ctermbg=" . "NONE"
    exec "hi Ignore         cterm=NONE"
    exec "hi Number         cterm=NONE   ctermfg=" . <SID>X(69) . " ctermbg=" . "NONE"
    exec "hi PreProc        cterm=NONE   ctermfg=" . 62         . " ctermbg=" . "NONE"
    exec "hi Special        cterm=NONE   ctermfg=" . <SID>X(55) . " ctermbg=" . "NONE"
    exec "hi SpecialChar    cterm=NONE   ctermfg=" . <SID>X(55) . " ctermbg=" . "NONE"
    exec "hi Statement      cterm=NONE   ctermfg=" . 80         . " ctermbg=" . "NONE"
    exec "hi cConditional   cterm=NONE   ctermfg=" . <SID>X(27) . " ctermbg=" . "NONE"
    "change statements for tex
    "
    exec "hi texStatement   cterm=NONE   ctermfg=" . 167        . " ctermbg=" . "NONE"
    exec "hi texSection     cterm=NONE   ctermfg=" . 220        . " ctermbg=" . "NONE"
    exec "hi texTypeStyle   cterm=NONE   ctermfg=" . 229        . " ctermbg=" . "NONE"
    exec "hi texTabularVertline   cterm=NONE   ctermfg=" . 228        . " ctermbg=" . "NONE"
    exec "hi texSpecialChar cterm=NONE   ctermfg=" . 173        . " ctermbg=" . "NONE"

    exec "hi Todo           cterm=BOLD   ctermfg=" . <SID>X(16) . " ctermbg=" . <SID>X(57)
    exec "hi Type           cterm=NONE   ctermfg=" . <SID>X(71) . " ctermbg=" . "NONE"
    exec "hi Underlined     cterm=BOLD   ctermfg=" . <SID>X(77) . " ctermbg=" . "NONE"
    exec "hi TaglistTagName cterm=BOLD   ctermfg=" . <SID>X(39) . " ctermbg=" . "NONE"

    hi CursorLine term=none cterm=none guibg=#2e2e37
    hi CursorLineNr term=none cterm=none guibg=#2e2e37
    exec "hi CursorLineNr cterm=NONE ctermfg=26"
    exec "hi YcmErrorSign cterm=BOLD ctermfg=" . 160 . "ctermbg=" . "NONE"
    exec "hi YcmWarningSign cterm=BOLD ctermfg=" . 178 . "ctermbg=" . "NONE"
    exec "hi YcmInlayHint cterm=NONE ctermfg=" . 59 . "ctermbg=" . "NONE"
    exec "hi rustCommentLineDoc cterm=NONE ctermfg=" . 153 . "ctermbg=" . "NONE"
    exec "hi rustSelf cterm=NONE ctermfg=" . 202 . "ctermbg=NONE"

    if v:version >= 700
        exec "hi Pmenu          cterm=NONE   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(82)
        exec "hi PmenuSel       cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(38)
        exec "hi PmenuSbar      cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(39)
        exec "hi PmenuThumb     cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(39)

        exec "hi SpellBad       cterm=NONE ctermbg=" . <SID>X(32)
        exec "hi SpellRare      cterm=NONE ctermbg=" . <SID>X(33)
        exec "hi SpellLocal     cterm=NONE ctermbg=" . <SID>X(36)
        exec "hi SpellCap       cterm=NONE ctermbg=" . <SID>X(21)
        exec "hi MatchParen     cterm=NONE ctermbg=" . 242 . "ctermfg=" . 255 
    endif
    if v:version >= 703
        exec "hi Conceal      cterm=NONE      ctermfg=" . <SID>X(55) . " ctermbg=" . "NONE"
        exec "hi ColorColumn  cterm=NONE      ctermbg=" . <SID>X(81)
    endif
endif

" vim: set et :
