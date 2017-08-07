///_scr_textbox_inserttext(string);

var s = _scr_text_sanitize(argument0);
var sLen = string_length(s);

var val = string_insert(s, value, _cursorPos+1);
if (val != value) {
    value = val;
    _changed = true;
    _modifyTarget = true;
}

_txtLen = string_length(value);
_txtW = string_width(value);
_txtH = string_height(value);

var coffset = 0;

_lo = _cursorPos - _visibleCursorPos +1;

for (var i = 1; i <= _txtLen; i++) {
    var txt = string_copy(value, 1+_lo, i+1);
    if (string_width(txt) > _txtAreaW) break;
}

// chk if the text is longer than the box    
if (_txtW > _txtAreaW ) {

// cursor is at the end
if (_txtLen == _cursorPos+sLen) {
//show_debug_message("a " + string(sLen));
    _scr_textbox_scrolltxt(sLen);
    coffset = _cursorPos+sLen+1;

// visible cursor is near end, shift 6 for usability
} else if (_visibleCursorPos == string_length(txt)-1) { // && 

if (_txtLen > _cursorPos+4) {
//show_debug_message("b1 " + string(sLen));
_scr_textbox_scrolltxt(6);
} else {
//show_debug_message("b2 " + string(sLen));
_scr_textbox_scrolltxt(sLen);
}
    coffset = _cursorPos+sLen;

// cursor is near start or middle
} else {
//show_debug_message("c " + string(sLen));
    _scr_textbox_scrolltxt(-sLen);
    coffset = _cursorPos+sLen;
}

// text is not longer than the box
} else {
//show_debug_message("d " + string(sLen));
_scr_textbox_scrolltxt(-sLen);
coffset = _cursorPos+sLen;
}

for (var i = 1; i <= _txtLen; i++) {
    var txt = string_copy(value, 1+_lo, i+1);
    if (string_width(txt) > _txtAreaW) break;
}

_ro = max(_txtLen-i-_lo, 0);
_visibleTxt = string_copy(value, 1+_lo, _txtLen-_ro-_lo);

// sanitization fix
if (string_char_at(_visibleTxt, 1) == "#") { _visibleTxt = "\" + _visibleTxt; } 

_scr_textbox_setcursorpos(coffset);
_scr_textbox_invalidatesurface();
_showCursor = false;
