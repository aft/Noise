/// scr_dropdown_set_scrollbar_width(dropdown_instance, width_px);
/**
 * @brief  Sets the width of the vertical scroll bar in the dropdown popup.
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 * @param  {number} width_px    Width in pixels
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise.
 *
 * @see    scr_dropdown_set_scrollbar_padding
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _scrollBarW = argument1;
    _scr_dropdown_calcsizes();
    _scr_dropdown_updatekeys();
    return true;
}

