/// scr_checkbox_unset_on_change_cb(checkbox_instance);
/**
* @brief  Unsets the callback script to be run when there is a value change of the checkbox
*
* @param  {checkbox_instance} checkbox_instance An instance of a checkbox
*
* @return {boolean} Returns undefined if instance can't be found or operation fails
*                   Returns true otherwise
*
* @see scr_checkbox_set_on_change_cb
*/

var o = argument0;
if (!instance_exists(o)) return undefined;

o.onChangeCallbackScript = undefined;
o._oCargs = undefined;
return true;    

