/// scr_radio_unset_on_change_cb(radio_instance);
/**
* @brief  Unsets the callback script to be run when there is a value change of the radio
*
* @param  {radio_instance} radio_instance An instance of a radio
*
* @return {boolean} Returns undefined if instance can't be found or operation fails
*                   Returns true otherwise
*
* @see scr_radio_set_on_change_cb
*/

var o = argument0;
if (!instance_exists(o)) return undefined;

o.onChangeCallbackScript = undefined;
o._oCargs = undefined;
return true;    

