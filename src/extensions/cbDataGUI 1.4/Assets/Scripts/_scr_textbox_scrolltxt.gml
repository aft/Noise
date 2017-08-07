var offset = argument0;

if (offset == 0) { exit; } // infinite loop precaution

// set left offset
if ((offset >= _txtLen) && (_ro > 0)) { // this is a stupid fix but needed coz of the sanitization
   // go to the end
    _lo = _txtLen-string_length(_scr_text_unsanitize(_visibleTxt));
} else {
   // go somewhere that is not the end
    _lo = clamp(_lo+offset, 0, _txtLen-string_length(_visibleTxt));
}

for (var i=0; i < _txtLen; i++) {
    var txt = string_copy(value, 1+_lo, i+1);
    if (string_width(txt) > _txtAreaW) break;
}

// set right offset
_ro = max(_txtLen-i-_lo, 0);

// set correct visible text
_visibleTxt = string_copy(value, 1+_lo, _txtLen-_ro-_lo);

// sanitization fixes
if (string_char_at(_visibleTxt, 0) == "#") {
    //_scr_textbox_scrolltxt(sign(offset)*1+1);
    _lo += sign(offset);
    _ro -= sign(offset)-1;

    _visibleTxt = string_copy(value, 1+_lo, _txtLen-_ro-_lo);
}


_scr_textbox_invalidatesurface();

