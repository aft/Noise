/// scr_slider_set_padding(slider_instance, hPadding_px, vPadding_px);
/**
 * @brief  Sets the horizontal and vertical space between the outer 
 *         border and the indicator bar
 *
 * @param  {slider_instance} slider_instance An instance of a slider
 * @param  {number} hPadding_px  Horizontal space in pixels
 * @param  {number} vPadding_px  Vertical space in pixels
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    hPadding = argument1;
    vPadding = argument2;
    _scr_slider_calcsizes();
    return true;
}
