///_scr_button_calcsizes();

// if scale is set on the room editor, obey it. 
// else, use constructor values and set scale for collision.
if (sprite_index != undefined) {
    if (image_xscale != 1) {
        _buttonW = sprite_get_width(sprite_index)*image_xscale;
    } else {
        image_xscale = _buttonW / sprite_get_width(sprite_index);
    }

    if (image_yscale != 1) _buttonH = sprite_get_height(sprite_index)*image_yscale;
    else image_yscale = _buttonH / sprite_get_height(sprite_index);
}

