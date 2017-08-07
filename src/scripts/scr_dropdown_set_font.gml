/// scr_dropdown_set_font(dropdown_instance, body_font, popup_font);
/**
 * @brief  Sets fonts for the body and the popup. 
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 * @param  {asset_font} body_font     Font resource for body text
 * @param  {asset_font} popup_font    Font resource for popup text
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise.
 *
 * @see    scr_dropdown_set_font_align
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    fontBody = argument1;
    fontPopup = argument2;
    _scr_dropdown_calcsizes();
    _scr_dropdown_updatekeys();
    _scr_dropdown_setpopup();
    return true;
}

