///scr_colorpicker_set_font(dropdown_instance, asset_font);
/**
 * @brief  Sets a font for the color info text.
 *
 * @param  {colorpicker_instance} colorpicker_instance An instance of a colorpicker
 * @param  {asset_font} asset_font     Font resource
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns undefined if fails. 
 *                   Returns true if successful.
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    font = argument1;
    return true;
}
