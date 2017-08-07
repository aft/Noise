/// scr_slider_get_step(slider_instance);
/**
 * @brief  Gets the increment/decrement step value of the slider.
 *
 * @param  {slider_instance} slider_instance An instance of a slider
 *
 * @return {float} Returns undefined if instance can't be found
 *                 Returns undefined if no step value is set
 *                 Returns the value otherwise
 *
 * @see scr_slider_set_step
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
return o._stepValue;


