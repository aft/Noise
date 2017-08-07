// mouse over check
if (position_meeting(_nx, _ny, self) && !_mouseOver) {
    if (scr_cbGUI_mouse(true)) {
        _mouseOut = false;
        _mouseOver = true;
        _scr_cbGUI_onMouseOver_cb_handler();
    }
}

// mouse out check
if ((!position_meeting(_nx, _ny, self) || !scr_cbGUI_mouse(true)) && _mouseOver && !_pressed) {
    _mouseOver = false;
    _mouseOut = true;
    _scr_cbGUI_onMouseOut_cb_handler();
}

// mouse down check
if (position_meeting(_nx, _ny, self) && !_pressed) {
    if (scr_cbGUI_mouse(mouse_check_button(mb_left))) {
        _pressed = true;
        _scr_cbGUI_onMouseDown_cb_handler();
    }
}

// vk_enter key down || vk_space key down
if (_onFocus && !_pressed && (keyboard_check(vk_space) || keyboard_check(vk_enter))) {
    _pressed = true;
    _scr_cbGUI_onMouseDown_cb_handler();
}

// vk_enter key up || vk_space key up
if (_onFocus && _pressed && mouse_check_button_released(mb_left)) ||
   (_onFocus && _pressed && (keyboard_check_released(vk_space) || keyboard_check_released(vk_enter))) {
    _pressed = false;
    _scr_cbGUI_onMouseUp_cb_handler();
}


