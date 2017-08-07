/// scr_checkbox_unset_target(checkbox_instance);
/**
 * @brief  Clears the manipulation order
 *
 * @param  {checkbox_instance}       checkbox_instance  An instance of a checkbox
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 *
 * @see scr_checkbox_set_target
 * @see scr_checkbox_get_target
 * @see scr_checkbox_get_target_variable_name
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    return _scr_cbGUI_unset_target();
}
