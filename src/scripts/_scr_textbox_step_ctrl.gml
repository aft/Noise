///ctrl interactions

if (_onFocus && keyboard_check(vk_control)) {
    // copy
    if (keyboard_check_pressed(ord("C")) && _selected) {
        // copy _selection to clipboard
        var selectedText = _scr_textbox_getselectedtext();
        show_debug_message("Copied to clipboard: " + selectedText);
        clipboard_set_text(selectedText);
    }
    
    // cut
    if (keyboard_check_pressed(ord("X")) && _selected) {
        // cut _selection to clipboard
        var selectedText = _scr_textbox_getselectedtext();
        show_debug_message("Cut to clipboard: " + selectedText);
        clipboard_set_text(selectedText);
        _scr_textbox_remove();
    }
    
    // select all text
    if (keyboard_check_pressed(ord("A")) && _txtLen > 0) {
        _selection[@0] = 0;
        _selection[@1] = _txtLen;
        _selected = true;
        //_scr_textbox_setcursorpos(_txtLen);
    }
    
    // paste
    if (keyboard_check_pressed(ord("V"))) {
        // copy _selection to clipboard
        if (_selected) _scr_textbox_remove();
        if (clipboard_has_text()) {
            var ctxt = clipboard_get_text();
            show_debug_message("Pasting from clipboard: " + ctxt);
            for (var i=1; i <= string_length(ctxt); i++) {
                _scr_textbox_inserttext(string_char_at(ctxt, i));
            }
        }
    }
}
