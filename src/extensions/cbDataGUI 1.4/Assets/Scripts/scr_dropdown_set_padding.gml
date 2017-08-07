/// scr_dropdown_set_padding(dropdown_instance, left_padding_px, right_padding_px);
/**
 * @brief  Sets the spaces between the dropdown border and the content inside.
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 * @param  {number} left_padding_px    Left padding in pixels
 * @param  {number} right_padding_px   Right padding in pixels
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise.
 *
 * @see    scr_dropdown_set_popup_padding
 * @see    scr_dropdown_set_scrollbar_padding
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _leftPadding = argument1;
    _rightPadding = argument2;
    _scr_dropdown_calcsizes();
    _scr_dropdown_updatekeys();
    return true;
}


