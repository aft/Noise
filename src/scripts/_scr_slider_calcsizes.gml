///_scr_slider_calcsizes();

// if scale is set on the room editor, obey it. 
// else, use constructor values and set scale for collision.
if (image_xscale != 1) _sliderW = sprite_get_width(sprite_index)*image_xscale;
else image_xscale = _sliderW / sprite_get_width(sprite_index);
if (image_yscale != 1) _sliderH = sprite_get_height(sprite_index)*image_yscale;
else image_yscale = _sliderH / sprite_get_height(sprite_index);

// indicator parameters
_scr_slider_calcindicator();
