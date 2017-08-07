/// scr_dropdown_set_popup_padding(dropdown_instance, top_padding_px, bottom_padding_px);
/**
 * @brief  Sets the spaces between the dropdown popup border and the content.
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 * @param  {number} top_padding_px      Top padding in pixels
 * @param  {number} bottom_padding_px   Bottom padding in pixels
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise.
 *
 * @see    scr_dropdown_set_padding
 * @see    scr_dropdown_set_scrollbar_padding
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _popupTopPadding = argument1;
    _popupBottomPadding = argument2;
    _scr_dropdown_calcsizes();
    return true;
}

