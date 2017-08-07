/// scr_dropdown_set_sizes(dropdown_instance, body_width_px, body_height_px);
/**
 * @brief  Sets the width and height of the dropdown box.
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 * @param  {number} body_width_px    Width in pixels
 * @param  {number} body_height_px   Height in pixels
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise.
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _bodyW = argument1;
    _bodyH = argument2;
    image_xscale = 1;
    image_yscale = 1;
    _scr_dropdown_calcsizes();
    _scr_dropdown_updatekeys();
    _scr_dropdown_setpopup();
    return true;
}

