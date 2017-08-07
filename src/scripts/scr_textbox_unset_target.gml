/// scr_textbox_unset_target(textbox_instance);
/**
 * @brief  Clears the manipulation order
 *
 * @param  {textbox_instance}       textbox_instance  An instance of a textbox
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 *
 * @see scr_textbox_set_target
 * @see scr_textbox_get_target
 * @see scr_textbox_get_target_variable_name
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    return _scr_cbGUI_unset_target();
}
