/// scr_dropdown_set_popup_lineheight(dropdown_instance, height_px);
/**
 * @brief  Sets the height of a single row in the dropdown list. You may
 *         need to adjust this value depending on your popup font size.
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 * @param  {number} height_px    Height in pixels
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise.
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _popupLH = argument1;
    return true;
}
