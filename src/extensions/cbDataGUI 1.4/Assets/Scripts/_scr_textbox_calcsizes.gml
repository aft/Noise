/// _scr_textbox_calcsizes();

// if scale is set on the room editor, obey it. 
// else, use constructor values and set scale for collision.
if (image_xscale != 1) _bodyW = sprite_get_width(sprite_index)*image_xscale;
else image_xscale = _bodyW / sprite_get_width(sprite_index);
if (image_yscale != 1) _bodyH = sprite_get_height(sprite_index)*image_yscale;
else image_yscale = _bodyH / sprite_get_height(sprite_index);


// get visible text area sizes
_txtAreaW = _bodyW-padding*2-indent;
_txtAreaH = _bodyH-padding*2-indent;
_textH = sprite_get_height(sprite_index)/2;

