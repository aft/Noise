///scr_slider_get_value(slider_instance);
/**
 * @brief  Gets the value of the slider. To get the percentage, use scr_slider_get_percentage
 *
 * @param  {slider_instance} slider_instance An instance of a slider
 *
 * @return {float} Returns undefined if instance can't be found
 *                 Returns float if value is set
 *
 * @see scr_slider_get_value
 * @see scr_slider_get_percentage
 * @see scr_slider_set_percentage
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
return o.value;

