
// close popup and focus
if (_open) {
    
    // scrolling with mouse
    // only condition to be able to scroll is popup being open.  
    if (_scrollingStarted) {
        _sbY1 = clamp(_ny - (_scrollingStartY) , _popupY1 + _scrollBarTopPadding, _popupY2 - _scrollBarBottomPadding - _scrollBarH);
        _sbY2 = _sbY1 + _scrollBarH;
        _lineOffset = 10 * (_sbY1-_popupY1-_scrollBarTopPadding) div ((_popupY2 - _scrollBarBottomPadding - _popupY1 - _scrollBarTopPadding) - _scrollBarH);
        _lineOffset = abs(_lineOffset);
    }

    // only calculate hover value if the mouse is inside the popup.
    if (_nx >= x + _popupX1 && _nx <= x + _popupX2 - (_sbX2 - _sbX1) && 
        _ny >= y + _popupY1 && _ny <= y + _popupY2) {
        _hover = (_ny - y - (_bodyH + _popupOffset + _popupTopPadding)) div _popupLH;
        _hover = clamp(_hover, 0, array_length_1d(_visibleKeys)-1);
        
        // mouse wheels & scroll. after this setscrollbar script needs to run.
        if (mouse_wheel_up()) {
            _lineOffset--; 
            _scr_dropdown_setscrollbar(); // needs to run after mouse wheel up and down
        }
        if (mouse_wheel_down()) {
            _lineOffset++; 
            _scr_dropdown_setscrollbar(); // needs to run after mouse wheel up and down
        }   
    }
    
    // if clicked on the scrollbar
    if (mouse_check_button(mb_left) && 
        _nx >= x + _sbX1 && _nx <= x + _sbX2 &&
        _ny >= y + _sbY1 && _ny <= y + _sbY2) {
        // mouse down on scrollbar
        if (!_scrollingStarted) _scrollingStartY = _ny - _sbY1; // relative y (mouse y to object y)
        _scrollingStarted = true;
    }
    
    // released the left mouse button    
    if (_scrollingStarted && mouse_check_button_released(mb_left)) {
        // end the scroll
        _scrollingStarted = false;
    }
    
    /* IMPORTANT!!!: needed after everytime _lineOffset changes. 
             note that it is being changed on multiple occasions 
             not dry but more optimized way */
    _lineOffset = clamp(_lineOffset, 0, max(0, _lineNo - _maxLineNo)); // read the note
    
    // if clicked inside the popup
    if (mouse_check_button_pressed(mb_left) && 
        _nx >= x + _popupX1 && _nx <= x + _popupX2 - (_sbX2 - _sbX1) &&
        _ny >= y + _popupY1 && _ny <= y + _popupY2) {
        
        _scr_dropdown_setvaluebyitemno(_hover);
        _scr_dropdown_openpopup(false);
        with (obj_cbGUI_dropdown) {
            _skip = true;
        }
        _scr_cbGUI_setactive();
        _skip = false;
        //_scr_dropdown_onchange();
        // PROBLEM

    // clicked on the scrollbar bg
    } else if (mouse_check_button_pressed(mb_left) &&
               _nx >= x + _sbX1 && _nx <= x + _sbX2 &&
               _ny >= y + _popupY1 && _ny <= y + _popupY2) {

        // above scrollbar
        if (_ny < y + _sbY1) {
            _lineOffset -= 5; 
            _scr_dropdown_setscrollbar(); // needs to run after mouse wheel up and down
        // below scrollbar
        } else if (_ny > y + _sbY2) {
            _lineOffset += 5; 
            _scr_dropdown_setscrollbar(); // needs to run after mouse wheel up and down
        }
        //exit;

/*
    // clicked on the scrollbar
    } else if (mouse_check_button_pressed(mb_left) &&
               _nx >= x + _sbX1 && _nx <= x + _sbX2 &&
               _ny >= y + _sbY1 && _ny <= y + _sbY2) {
        // do nothing
        exit;
        */
    // if clicked outside the popup
    } else if (mouse_check_button_pressed(mb_left)) {
        _scr_dropdown_openpopup(false);
        with (obj_cbGUI_dropdown) {
            _skip = true;
        }
        _scr_cbGUI_setactive();
        _skip = false;
    }
    //exit;    
}

// un-focus dropdown
if (!position_meeting(_nx, _ny, self) && !disabled && mouse_check_button_pressed(mb_left) && !_open && _onFocus) {
    _onFocus = false;
    with (obj_cbGUI_dropdown) {
        _skip = false;
    }
}

// open popup and focus
if (position_meeting(_nx, _ny, self) && !disabled && mouse_check_button_pressed(mb_left) && !_open) {
    _scr_cbGUI_setactive();
    _scr_dropdown_openpopup(true);
    with (obj_cbGUI_dropdown) {
        _skip = true;
    }
    _skip = false;
}

// remove skips
if (!disabled && !_open && _onFocus) {
    with (obj_cbGUI_dropdown) {
        _skip = false;
    }
}

