if (keyboard_check(vk_shift)) {
    if (!_selected) {
        _selection[@0] = _cursorPos;
        _selection[@1] = _cursorPos;
        _selected = true;
    }
    _selection[@0] = _txtLen;

    _scr_textbox_setcursorpos(_txtLen+1);
    _scr_textbox_scrolltxt(string_length(value));
    if (abs(_selection[0] - _selection[1]) == 0) _scr_textbox_unselect();
    
} else {
    _scr_textbox_scrolltxt(_txtLen);
    _scr_textbox_setcursorpos(_txtLen+1);
    _scr_textbox_unselect();
}

_scr_textbox_invalidatesurface();
