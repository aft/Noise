/// scr_slider_get_min_limit(slider_instance);
/**
 * @brief  Gets minimum limit value for the slider
 *
 * @param  {slider_instance} slider_instance An instance of a slider
 *
 * @return {float} Returns undefined if instance can't be found
 *                 Returns min limit value
 *
 * @see scr_slider_set_range
 * @see scr_slider_get_max_limit
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
return o.minLimit;

