/// scr_slider_set_range(slider_instance, min_value_number, max_value_number);
/**
 * @brief  Sets minimum and maximum limit values for the slider
 *
 * @param  {slider_instance} slider_instance An instance of a slider
 * @param  {float}   min_value_number  Minimum value the slider can have
 * @param  {float}   max_value_number  Maximum value the slider can have
 *
 * @return {float} Returns undefined if instance can't be found
 *                 Returns true otherwise
 *
 * @note  Always use this script to set minimum and maximum limits to the slider
 *
 * @see scr_slider_get_min_limit
 * @see scr_slider_get_max_limit
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _scr_slider_setrange(argument1, argument2);
    return true;
}

