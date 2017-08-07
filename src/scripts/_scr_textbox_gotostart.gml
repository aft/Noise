// go to start
if (keyboard_check(vk_shift) || _selectionStarted) {
    if (!_selected) {
        _selection[@0] = _cursorPos;
        _selection[@1] = _cursorPos;
        _selected = true;
    }
    _selection[@0] = 0;
    _scr_textbox_scrolltxt(-_cursorPos);
    _scr_textbox_setcursorpos(0);
    if (abs(_selection[0] - _selection[1]) == 0) _scr_textbox_unselect();

} else {
    _scr_textbox_scrolltxt(-_cursorPos);
    _scr_textbox_setcursorpos(0);
    _scr_textbox_unselect();
}

_scr_textbox_invalidatesurface();
