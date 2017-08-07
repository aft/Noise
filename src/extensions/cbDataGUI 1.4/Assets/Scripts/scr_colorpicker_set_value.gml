/// scr_colorpicker_set_value(colorpicker_instance, color);
/**
 * @brief  Sets color of the colorpicker. The value must be a valid color.
 *
 * @param  {colorpicker_instance} colorpicker_instance    An instance of a colorpicker
 * @param  {color} color     Color. GMS constants are also allowed (like c_black, c_yellow etc.)
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns newly set color value
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    var ret = _scr_colorpicker_setvalue(argument1);
    _changed = false; // prevent cb trigger
    return ret;
}

