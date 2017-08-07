/// scr_slider_set_step(slider_instance, step_value_number);
/**
 * @brief  Sets the increment/decrement step value of the slider. To
 *         remove the step value, just set it to undefined.
 *
 * @param  {slider_instance} slider_instance An instance of a slider
 * @param  {float}   step_value_number  The value of the increment/decrement
 *
 * @return {float} Returns undefined if instance can't be found
 *                 Returns the new value
 *
 * @see scr_slider_get_step
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
o._stepValue = argument1;
return argument1;


