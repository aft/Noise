///_scr_dropdown_openpopup(boolean);
_open = argument0;

if (argument0) {
    depth -= 100000;
    image_yscale = (_bodyH + _popupY2 - _popupY1) / sprite_get_height(sprite_index);
} else {
    depth += 100000;
    image_yscale = _bodyH / sprite_get_height(sprite_index);
}

mouse_clear(mb_left);
return argument0;
