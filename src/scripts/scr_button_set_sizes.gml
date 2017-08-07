/// scr_button_set_sizes(button_instance, width_px, height_px);
/**
 * @brief  Sets the width and height of the button.
 *
 * @param  {button_instance} button_instance    An instance of a button
 * @param  {number} width_px    Width in pixels
 * @param  {number} height_px  Height in pixels
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _buttonW = argument1;
    _buttonH = argument2;
    image_xscale = 1;
    image_yscale = 1;
    _scr_button_calcsizes();
}
return true;

