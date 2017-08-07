/// scr_textbox_unset_on_submit_cb(textbox_object);
/**
 * @brief  Unsets a callback script to be run when the user presses the ENTER key in the textbox.
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {boolean} Returns undefined if instance can't be found or operation fails
 *                   Returns true otherwise
 *
 * @see scr_textbox_set_on_submit_cb
 * @see scr_textbox_set_on_change_cb
 * @see scr_textbox_unset_on_change_cb
 */

var o = argument[0];
if (!instance_exists(o)) return undefined;

o.onSubmitCallbackScript = undefined;
o._oSargs = undefined;
return true;    

