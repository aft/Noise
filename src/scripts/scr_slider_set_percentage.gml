///scr_slider_set_percentage(slider_instance, float);
/**
 * @brief  Sets the percentage the slider cursor is at. The value should be between 0.0 and 1.0
 *
 * @param  {slider_instance} slider_instance An instance of a slider
 *
 * @return {float} Returns undefined if instance can't be found
 *                 Returns the new percentage as float
 *
 * @see scr_slider_get_percentage
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _scr_slider_setperc(argument1);
    _changed = false; // prevent cb trigger
    return _perc;
}


