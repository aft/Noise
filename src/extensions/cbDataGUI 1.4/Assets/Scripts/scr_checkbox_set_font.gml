/// scr_checkbox_set_font(checkbox_instance, font);
/**
 * @brief  Sets the font of the checkbox
 *
 * @param  {checkbox_instance} checkbox_instance An instance of a checkbox
 * @param  {font_asset} font Name of the font resource
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true if successful
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    font = argument1;
    return true;
}
