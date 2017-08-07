/// scr_colorpicker_set_value_rgb(colorpicker_instance, r, g, b);
/**
 * @brief  Sets color of the colorpicker using red, green, blue channel values.
 *         R, G, B values are integers between 0 and 255.
 *
 * @param  {colorpicker_instance} colorpicker_instance An instance of a colorpicker
 * @param  {number} r    Red value (0-255)
 * @param  {number} g    Green value (0-255)
 * @param  {number} b    Blue value (0-255)
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns newly set color value
 *
 * @see    scr_colorpicker_set_value
 * @see    scr_colorpicker_set_value_hsv
 * @see    scr_colorpicker_set_value_hex
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

var r = floor(argument1 mod 255);
var g = floor(argument1 mod 255);
var b = floor(argument1 mod 255);
var col = make_color_rgb(r, g, b);

with (o) {
    var ret = _scr_colorpicker_setvalue(col);
    _changed = false; // prevent cb trigger
    return ret;
}
