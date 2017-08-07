///scr_dropdown_set_scrollbar_padding(dropdown_instance, top_padding_px, right_padding_px, bottom_padding_px);
/**
 * @brief  Sets the spaces between the scrollbar and the popup border.
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 * @param  {number} top_padding_px      Top padding in pixels
 * @param  {number} right_padding_px    Right padding in pixels
 * @param  {number} bottom_padding_px   Bottom padding in pixels
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise.
 *
 * @see    scr_dropdown_set_popup_padding
 * @see    scr_dropdown_set_padding
 */
// TODO: add left padding
var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _scrollBarTopPadding = argument1;
    _scrollBarRightPadding = argument2;
    _scrollBarBottomPadding = argument3;
    _scr_dropdown_calcsizes();
    return true;
}
