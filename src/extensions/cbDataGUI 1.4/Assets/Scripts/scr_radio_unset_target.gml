/// scr_radio_unset_target(slider_instance);
/**
 * @brief  Clears the manipulation order
 *
 * @param  {radio_instance}       radio_instance  An instance of a radio
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 *
 * @see scr_radio_set_target
 * @see scr_radio_get_target
 * @see scr_radio_get_target_variable_name
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    return _scr_cbGUI_unset_target();
}
