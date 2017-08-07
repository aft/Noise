/// scr_slider_set_color(slider_instance, indicator_bar_color, focused_out_indicator_color, disabled_indicator_color);
/**
 * @brief  Sets the colors of the slider. Use -1 for the colors you don't want to change.
 *
 * @param  {slider_instance} slider_instance An instance of a slider
 * @param  {number}   indicator_bar_color          Color of the indicator bar in normal state
 * @param  {number}   focused_out_indicator_color  Color of the indicator bar when not focused
 * @param  {number}   disabled_indicator_color     Color of the indicator bar in disabled state
 *
 * @return {number} Returns undefined if instance can't be found
 *                   Returns true otherwise
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (argument1 > -1) c_indicator = argument1;
    if (argument2 > -1) c_foutIndicator = argument2;
    if (argument3 > -1) c_disabledIndicator = argument3;
    return true;
}
