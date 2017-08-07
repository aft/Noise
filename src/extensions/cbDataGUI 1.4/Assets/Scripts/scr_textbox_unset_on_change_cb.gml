/// scr_textbox_unset_on_change_cb(textbox_instance);
/**
 * @brief  Unsets the callback script to be run when there is a value change in the textbox.
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {boolean} Returns undefined if instance can't be found or operation fails
 *                   Returns true otherwise
 *
 * @see scr_textbox_set_on_change_cb
 * @see scr_textbox_set_on_submit_cb
 * @see scr_textbox_unset_on_submit_cb
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

o.onChangeCallbackScript = undefined;
o._oCargs = undefined;
return true;    

