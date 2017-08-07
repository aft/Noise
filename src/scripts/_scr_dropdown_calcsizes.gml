_bodyH = sprite_get_height(sprite_index);

// if scale is set on the room editor, obey it. 
// else, use constructor values and set scale for collision.
if (sprite_index != undefined) {
    if (image_xscale != 1) {
        _bodyW = sprite_get_width(sprite_index)*image_xscale;
    } else {
        image_xscale = _bodyW / sprite_get_width(sprite_index);
    }

    if (image_yscale != 1) _bodyH = sprite_get_height(sprite_index)*image_yscale;
    else image_yscale = _bodyH / sprite_get_height(sprite_index);
}

// these depend on bodyW so they should be set after the calcs
_iconX = _bodyW - sprite_get_width(sprite_icon) - _iconRightPadding;
_iconY = _iconTopPadding;
_popupTextX = 0;
_scr_dropdown_getptx(); // calcs popuptextx. needed for draw optimization
_popupTextW = _bodyW - _leftPadding - _rightPadding - _scrollBarW;
_bodyTextW = _bodyW - sprite_get_width(sprite_icon) - _leftPadding - _rightPadding;

// scale ends
