///_scr_button_getvisiblelabel();
if (label == undefined) exit;

draw_set_font(font);
draw_set_halign(halign);
draw_set_valign(valign);

var _txtW = _buttonW - (_leftPadding + _rightPadding);

if (string_width(label) > _txtW) {
    _visibleLabel = label;
    
    while ((string_width(_visibleLabel) + string_width("..")) > _txtW) {
        _visibleLabel = string_delete(_visibleLabel, ceil(string_length(_visibleLabel)/2), 1);
        if (string_width(_visibleLabel) + string_width("..") < _txtW) break;
    }
    _visibleLabel = string_insert("..", _visibleLabel, 1+floor(string_length(_visibleLabel)/2));
} else {
    _visibleLabel = label;
}


