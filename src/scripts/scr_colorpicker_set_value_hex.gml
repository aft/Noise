/// scr_colorpicker_set_value_hex(colorpicker_instance, RRGGBB);
/**
 * @brief  Sets color of the colorpicker using a hex value.
 *         R, G, B values are hex values between 00 and FF.
 *
 * @param  {colorpicker_instance} colorpicker_instance An instance of a colorpicker
 * @param  {number} r    Red value (00-FF)
 * @param  {number} g    Green value (00-FF)
 * @param  {number} b    Blue value (00-FF)
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns newly set color value
 *
 * @see    scr_colorpicker_set_value
 * @see    scr_colorpicker_set_value_hsv
 * @see    scr_colorpicker_set_value_rgb
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

var col = hex_to_color(argument1);

with (o) {
    var ret = _scr_colorpicker_setvalue(col);
    _changed = false; // prevent cb trigger
    return ret;
}
