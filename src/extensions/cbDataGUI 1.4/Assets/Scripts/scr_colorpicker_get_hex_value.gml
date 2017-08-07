/// scr_colorpicker_get_hex_value(colorpicker_instance);
/**
 * @brief  Gets the color as a hex value.
 *
 * @param  {colorpicker_instance} colorpicker_instance An instance of a colorpicker
 *
 * @return {string}  Returns undefined if instance can't be found. 
 *                   Returns color hex code as string
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
return o.value_hex;

