///_scr_textbox_setcursorpos(int);
var pos = floor(argument0);

_cursorPos = clamp(pos, 0, _txtLen);
_visibleCursorPos = clamp(pos-_lo, 0, string_length(_visibleTxt));
_cursorX = string_width(string_copy(_visibleTxt, 0, _visibleCursorPos));

_scr_textbox_invalidatesurface();

return _cursorPos;
