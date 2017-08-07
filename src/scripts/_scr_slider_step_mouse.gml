if (_onFocus && _dragging) {  //mouse_check_button(mb_left) &&
    // change value with mouse movement
    _scr_slider_setcursorpos(_nx-_iX);
}

if (_onFocus && mouse_check_button_released(mb_left) && _dragging) {
    // change value with mouse movement
    _dragging = false;
    _released = true;
}
