/// scr_button_set_padding(button_object_instance, left_padding_px, right_padding_px);
/**
 * @brief  Sets the left padding and right padding values. Use -1 for the 
 *         argument you don't want to modify.
 *
 * @param  {button_instance} button_instance    An instance of a button
 * @param  {number} left_padding_px    Width in pixels
 * @param  {number} right_padding_px  Height in pixels
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (argument1 > -1) _leftPadding  = argument1;
    if (argument2 > -1) _rightPadding = argument2;
    _scr_button_calcsizes();
    return true;
}
