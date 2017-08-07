/// scr_dropbox_unset_target(dropbox_instance);
/**
 * @brief  Clears the manipulation order
 *
 * @param  {dropbox_instance}       dropbox_instance  An instance of a dropbox
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 *
 * @see scr_dropbox_set_target
 * @see scr_dropbox_get_target
 * @see scr_dropbox_get_target_variable_name
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    return _scr_cbGUI_unset_target();
}
