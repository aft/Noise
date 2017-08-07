/// scr_dropdown_unset_on_change_cb(dropdown_instance);
/**
* @brief  Unsets the callback script to be run when there is a value change of the dropdown
*
* @param  {dropdown_instance} dropdown_instance An instance of a dropdown
*
* @return {boolean} Returns undefined if instance can't be found or operation fails
*                   Returns true otherwise
*
* @see scr_dropdown_set_on_change_cb
*/

var o = argument0;
if (!instance_exists(o)) return undefined;

o.onChangeCallbackScript = undefined;
o._oCargs = undefined;
return true;    

