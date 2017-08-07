/// scr_colorpicker_auto_copy_to_clipboard(colorpicker_instance, boolean);
/**
 * @brief  Enable or disables the auto copy to clipboard feature. If enabled,
 *         anytime the color picker value if changed, it gets coppied to the
 *         clipboard automatically.
 *
 * @param  {colorpicker_instance} colorpicker_instance An instance of a colorpicker
 * @param  {boolean} boolean     True or false
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns newly set value.
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
with (o) {
    _copyToClipboard = argument1;
    return argument1;
}

