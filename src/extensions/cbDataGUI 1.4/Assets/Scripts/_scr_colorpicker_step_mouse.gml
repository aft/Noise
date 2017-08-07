var _px1, _px2, _py1, _py2;
_px1 = x;
_py1 = y + _bodyH + _border * 2 + _yoffset;
_px2 = x + 128;
_py2 = _py1 + _popupH;

var oncolor = point_in_rectangle(_nx, _ny, x, y, x+_bodyW, y+_bodyH);
var posmet = position_meeting(_nx, _ny, self);
var inpopup = point_in_rectangle(_nx, _ny, _px1, _py1, _px2, _py2);


if (_open && _onFocus) {
    if (point_in_rectangle(_nx, _ny, _px1 + 5, _py1 + 5, _px2 - 23, _py2 - 5) && _onFocus && !_dragging && !_huedragging) {
        if (scr_cbGUI_mouse(mouse_check_button(mb_left))) {
            _dragging = true;
            window_set_cursor(cr_none);
        }
    }
    
    if (point_in_rectangle(_nx, _ny, _px1 + 105, _py1 + 5, _px1 + 120, _py2 - 5) && _onFocus && !_dragging && !_huedragging) {
        if (scr_cbGUI_mouse(mouse_check_button(mb_left))) {
            _huedragging = true;
            window_set_cursor(cr_size_ns);
        }
    }
    
    if (mouse_check_button_released(mb_left) && _onFocus && (_dragging || _huedragging)) {
        _dragging = false;
        _huedragging = false;
        _released = true;
        window_set_cursor(cr_default);
    }

    if (_dragging) {
        // change value with mouse movement
        _cx = clamp(_nx - _px1 - 4 - _border, 0, 100);
        _cy = clamp(_ny - _py1 - 4 - _border, 0, 100);
        
        // saturation
        var _s = 2.55 * _cx;
        if (_sat != _s) {
            _sat = _s;
            _changed = true;
            _modifyTarget = true;
        }
        
        // brightness (value)
        var _v = 255 - (2.55 * _cy);
        if (_val != _v) {
            _val = _v;
            _changed = true;
            _modifyTarget = true;
        }
    }
    
    if (_huedragging) {
        // change value with mouse movement
        _hy = clamp(_ny - _py1 - 4 - _border, 0, 100);

        var _h = 2.55 * (100-_hy);
        if (_hue != _h) {
            _hue = _h
            _changed = true;
            _modifyTarget = true;
        }
    }
    
    // un-focus and close popup
    if (!posmet && !inpopup && mouse_check_button_pressed(mb_left) && _onFocus) {
        window_set_cursor(cr_default);
        _scr_colorpicker_openpopup(false);
        _onFocus = false;
    }
    
}

// open popup and focus
if (oncolor && mouse_check_button_pressed(mb_left)) {
    if (scr_cbGUI_mouse(true)) {
        _scr_cbGUI_setactive();
        _scr_colorpicker_openpopup(!_open);
    }
}

// un-focus and close popup
if (!posmet && !inpopup && mouse_check_button_pressed(mb_left) && _open && _onFocus) {
    window_set_cursor(cr_default);
    _scr_colorpicker_openpopup(false);
    _onFocus = false;
}

if (!_onFocus && _open && mouse_check_button(mb_left)) {
    window_set_cursor(cr_default);
    _scr_colorpicker_openpopup(false);
};

// if (scr_cbGUI_mouse(true)) 

