///_scr_textbox_getcursorpos(pixels);

var px = argument0; ///guiSize;
var len = string_length(_visibleTxt);

if (px < 0) return 0;
if (px > _txtW) return len;

var cpos = 0;
for (var i = 0; i <= len; i++) {
    if (string_width(string_copy(_visibleTxt, 1, i)) > px) break;
    cpos = i;
}

return cpos;

