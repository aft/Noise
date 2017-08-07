/// scr_colorpicker_set_value_hsv(colorpicker_instance, h, s, v);
/**
 * @brief  Sets color of the colorpicker using hue, saturation, value.
 *         H, s, v values are integers between 0 and 255.
 *
 * @param  {colorpicker_instance} colorpicker_instance An instance of a colorpicker
 * @param  {number} h    Hue value (0-255)
 * @param  {number} s    Saturation value (0-255)
 * @param  {number} v    Value (0-255)
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns newly set color value
 *
 * @see    scr_colorpicker_set_value
 * @see    scr_colorpicker_set_value_rgb
 * @see    scr_colorpicker_set_value_hex
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

var h = (argument1 mod 255);
var s = (argument1 mod 255);
var v = (argument1 mod 255);
var col = make_color_hsv(h, s, v);

with (o) {
    var ret = _scr_colorpicker_setvalue(col);
    _changed = false; // prevent cb trigger
    return ret;
}
