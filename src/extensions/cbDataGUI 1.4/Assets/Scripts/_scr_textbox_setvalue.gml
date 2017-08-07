///_scr_textbox_setvalue(t);

// calculates visible text (_visibleTxt), 
// hidden chars on the left (_lo) and right (_ro)

var val = _scr_text_sanitize(string(argument0));
if (val != value) {
    value = val;
    _changed = true;
    _modifyTarget = true;
}

_txtLen = string_length(value);
_txtW = string_width(value);
_txtH = string_height(value);



if (_txtW > _txtAreaW) {
    // set left offset<
    for (var i = 0; _txtW > _txtAreaW; i++) {
        _lo = i;
        _visibleTxt = (string_copy(value, 1+_lo, _txtLen));
        
        if (string_width(_visibleTxt) <= _txtAreaW) break;
    }
    // set right offset
    var prev = _lo + string_length(_visibleTxt);
    if (prev < _txtLen) {
        _ro = _txtLen - prev;
    }
    
    _visibleTxt = (string_copy(value, 1+_lo, _txtLen-_ro));
} else {
    _visibleTxt = (value); _ro = 0; _lo = 0;
}

_scr_textbox_setcursorpos(_txtLen);
_scr_textbox_invalidatesurface();

_showCursor = false;

