/// scr_slider_unset_on_change_cb(slider_instance);
/**
 * @brief  Unsets the callback script to be run when there is a value change of the slider
 *
 * @param  {slider_instance} slider_instance An instance of a slider
 *
 * @return {boolean} Returns undefined if instance can't be found or operation fails
 *                   Returns true otherwise
 *
 * @see scr_slider_set_on_change_cb
 * @see scr_slider_set_on_release_cb
 * @see scr_slider_unset_on_release_cb
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

o.onChangeCallbackScript = undefined;
o._oCargs = undefined;
return true;    

