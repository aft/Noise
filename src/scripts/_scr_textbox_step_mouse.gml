if (_onFocus) { // nested for performance reasons

    if (mouse_check_button(mb_left)) {
        // reset the _selection if already _selected
        // if shift is being pressed, user wants to modify the _selection.
        if (!keyboard_check(vk_shift)) _selected = false; 
        
        _scr_textbox_setcursorpos(_lo+_scr_textbox_getcursorpos(_nx - x - real(lengthdir_x(padding+indent-2, rotation)) ));
        
        if (!_selectionStarted) {
            // mark _selection start position
            if (!keyboard_check(vk_shift)) _selection[@0] = _cursorPos;
        } else {
            // mark _selection end position
            _selection[@1] = _cursorPos;
            
            //scroll the visible text
            if (_nx < x || mouse_x <= _appPos[0]+padding) {
                _scr_textbox_scrolltxt(-1);
            }
            if (_nx > x+_txtAreaW || mouse_x >= _appPos[2]-padding) {
                _scr_textbox_scrolltxt(1);
            }
            
            // if two positions are different, then we have 
            // an active _selection
            if (_selection[@0] != _selection[@1]) _selected = true;
            _visibleCursorPos = _scr_textbox_getcursorpos(_nx - x - real(lengthdir_x(padding+indent-2, rotation)) );
        }
        _selectionStarted = true;
        //_scr_textbox_invalidatesurface();
    }
    
    if (mouse_check_button_released(mb_left)) {
       
        if (_selectionStarted) {
            _selectionStarted = false;
            if (keyboard_check(vk_shift)) _selection[@1] = _cursorPos;    
            if (_selection[@0] == _selection[@1]) {
                _scr_textbox_unselect();
            } else {
                _selected = true;
            }
            
        }
        // end _selection
        _selectionStarted = false;
        _showCursor = true;
    }

}
