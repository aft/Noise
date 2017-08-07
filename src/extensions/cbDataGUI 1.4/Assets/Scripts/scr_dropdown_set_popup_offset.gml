/// scr_dropdown_set_popup_offset(dropdown_instance, offset_px);
/**
 * @brief  Sets gap between the dropdown body and the popup box in pixels. 
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 * @param  {number} offset_px    Offset in pixels
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise.
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _popupOffset = argument1;
    return true;
}
