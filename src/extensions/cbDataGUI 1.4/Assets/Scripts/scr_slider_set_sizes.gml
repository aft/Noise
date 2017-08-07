/// scr_slider_set_sizes(slider_instance, width_px, height_px);
/**
 * @brief  Sets the width and the height of the slider
 *
 * @param  {slider_instance} slider_instance An instance of a slider
 * @param  {number} width_px  Width of the slider in pixels
 * @param  {number} height_px Height of the slider in pixels
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _sliderW = argument1;
    _sliderH = argument2;
    image_xscale = 1;
    image_yscale = 1;
    _scr_slider_calcsizes();
    return true;
}
    

