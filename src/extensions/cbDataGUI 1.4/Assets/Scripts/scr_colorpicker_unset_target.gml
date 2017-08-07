/// scr_colorpicker_unset_target(colorpicker_instance);
/**
 * @brief  Clears the manipulation order
 *
 * @param  {colorpicker_instance}       colorpicker_instance  An instance of a colorpicker
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 *
 * @see scr_colorpicker_set_target
 * @see scr_colorpicker_get_target
 * @see scr_colorpicker_get_target_variable_name
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    return _scr_cbGUI_unset_target();
}
