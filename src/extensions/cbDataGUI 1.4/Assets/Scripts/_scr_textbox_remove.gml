/// _scr_textbox_remove()

var c1 = min(_selection[0], _selection[1]);
var c2 = max(_selection[0], _selection[1]);
_scr_textbox_unselect();

value =  string_copy(value, 1, c1) + string_copy(value, 1+c2, _txtLen);

_txtLen = string_length(value);
_txtW = string_width(value);
_txtH = string_height(value);
var val = "";

if (_visibleCursorPos >= c1) {
    // show_debug_message("remove case 1");
    _lo = 0;
    val = "";
    for (var i =1; i <= _txtLen; i++) {
        val += string_char_at(value, i);
        if (string_width(val) >= _txtAreaW) break;
    }
/*
_ro = _txtLen - string_length(val) - _lo + 1;
_visibleTxt = string_copy(value, 1+_lo, _txtLen-_ro-_lo);
_scr_textbox_setcursorpos(c1);
*/
    if (_txtW > _txtAreaW ) {
        _visibleTxt = string_copy(value, 1+_lo, i-1);
        // if long, shift left
        if (_visibleCursorPos == string_length(_visibleTxt)) {
           _scr_textbox_scrolltxt(6);
        }
    } else {
        _visibleTxt = string_copy(value, 1+_lo, i);
    }
    _ro = _txtLen - _lo - string_length(_visibleTxt);
    _scr_textbox_setcursorpos(c1);
    // _lo = _txtLen - string_length(val) - _ro + 1;
} else {
    // show_debug_message("remove case 2");
    val = "";
    for (var i = _txtLen; i > 0; i--) {
        val = string_insert(string_char_at(value, 1+i), val, 1);
        if (string_width(val) >= _txtAreaW) break;
    }

    // we dont need _ro.
    _lo = _txtLen - string_length(_scr_text_unsanitize(val)) - _ro + 1;
    _visibleTxt = string_copy(value, 1+_lo, _txtLen-_ro-_lo);

    // sanitization fixes
    if (string_char_at(_visibleTxt, 1) == "#") {
        _visibleTxt = string_copy(_visibleTxt, 2, string_length(_visibleTxt));
    }

    _lo = max(0, _lo); 

    _scr_textbox_setcursorpos(c2-abs(c1-c2));

}

_changed = true;
_modifyTarget = true;
_scr_textbox_invalidatesurface();
 
