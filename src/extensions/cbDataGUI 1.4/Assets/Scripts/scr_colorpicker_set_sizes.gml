/// scr_colorpicker_set_sizes(colorpicker_object_instance, width_px, height_px, border_px);
/**
 * @brief  Sets the width, height and border thickness of the colorpicker. 
 *         Note that this doesn't change the size of the popup that opens 
 *         when the user click on the color picker.
 *
 * @param  {colorpicker_instance} colorpicker_instance An instance of a colorpicker
 * @param  {number} width_px     Width in pixels
 * @param  {number} height_px    Height in pixels
 * @param  {number} border_px    Border thickness in pixels
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise.
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _bodyW = argument1;
    _bodyH = argument2;
    _border = argument3;
    
    image_xscale = _bodyW;
    image_yscale = _bodyH;
    return true;
}
