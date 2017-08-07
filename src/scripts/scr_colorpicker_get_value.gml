/// scr_colorpicker_get_value(colorpicker_instance);
/**
 * @brief  Gets the color from the colorpicker.
 *
 * @param  {colorpicker_instance} colorpicker_instance An instance of a colorpicker
 *
 * @return {number} Returns undefined if instance can't be found. 
 *                   Returns a color
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
return o.value;

