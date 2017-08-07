///_scr_colorpicker_openpopup(bool);
_open = argument0;

// keep popup in the room
var hh = _bodyH + _border * 2;
if (y+_bodyH+_border*2+_popupH > room_height) _yoffset = -_popupH-hh;
else _yoffset = 0;

if (argument0) {
    depth -= 100010;
    // pff, need to do this to move the bounding box. gms deficiency or bug
    mask_index = spr_cbGUI_colorpicker_mask; 
    sprite_set_offset(mask_index, 0, -_yoffset-hh);
    image_xscale = 1; //image_xscale = 128; //max(128, _bodyW);
    image_yscale = 1; //image_yscale = _bodyH + _popupH;
   
} else {
    depth += 100010;
    mask_index = spr_cbGUI_1x1;
    image_xscale = _bodyW;
    image_yscale = _bodyH;
}

return argument0;
