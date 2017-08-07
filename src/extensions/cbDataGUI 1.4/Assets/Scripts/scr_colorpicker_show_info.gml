/// scr_colorpicker_show_info(colorpicker_instance, boolean);
/**
 * @brief  Enables or disables the hex color code text on the colorpicker
 *         button.
 *
 * @param  {colorpicker_instance} colorpicker_instance An instance of a colorpicker
 * @param  {boolean} boolean      True to show, false to hide the text
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns newly set value
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
with (o) {
    _showInfo = argument1;
    _scr_colorpicker_invalidatesurface();
    return argument1;
}

