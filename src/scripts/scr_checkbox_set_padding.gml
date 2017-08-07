/// scr_checkbox_set_padding(checkbox_instance, left_padding_px, top_padding_px);
/**
 * @brief  Use these values to make arrangement of the label position
 *
 * @param  {checkbox_instance} checkbox_instance An instance of a checkbox
 * @param  {number} left_padding_px             Left space of the label in pixels
 * @param  {number} top_padding_px              Top space of the label in pixels
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true if successful
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _leftPadding = argument1;
    _topPadding  = argument2;
    _scr_checkbox_calcsizes();
    return true;
}
