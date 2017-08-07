/// scr_slider_get_percentage(slider_instance);
/**
 * @brief  Gets the percentage the slider cursor is at. The returned value is between 0.0 and 1.0
 *
 * @param  {slider_instance} slider_instance An instance of a slider
 *
 * @return {float} Returns undefined if instance can't be found
 *                 Returns float
 *
 * @see scr_slider_set_percentage
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
return o._perc;

