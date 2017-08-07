/// scr_slider_unset_on_release_cb(slider_instance);
/**
 * @brief  Unsets the callback script to be run when the user ends adjusting the slider
 *
 * @param  {slider_instance} slider_instance An instance of a slider
 *
 * @return {boolean} Returns undefined if instance can't be found or operation fails
 *                   Returns true otherwise
 *
 * @see scr_slider_set_on_change_cb
 * @see scr_slider_unset_on_change_cb
 * @see scr_slider_set_on_release_cb
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

o.onReleaseCallbackScript = undefined;
o._oRargs = undefined;
return true;    

