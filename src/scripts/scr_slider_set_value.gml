/// scr_slider_set_value(slider_instance, float);
/**
 * @brief  Sets the value of the slider. The value is clamped if min and max
 *         limits are set. Check notes for more info.
 *
 * @param  {slider_instance} slider_instance An instance of a slider
 * @param  {float}   float  Values with decimal are accepted
 *
 * @return {float} Returns undefined if instance can't be found
 *                 Returns the new value
 *
 * @note  Remember to set min limit and max limit for the slider first
 *        If max limit is not set, the value will also be set as max 
 *        limit. Min limit will be set as 0.
 *
 * @see scr_slider_set_range
 * @see scr_slider_get_min_limit
 * @see scr_slider_get_max_limit
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _scr_slider_setvalue(argument1);
    _changed = false; // prevent cb trigger
    return argument1;
}

