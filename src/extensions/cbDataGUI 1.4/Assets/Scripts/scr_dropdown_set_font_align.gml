/// scr_dropdown_set_font_align(dropdown_instance, halign, valign);
/**
 * @brief  Sets fonts for the body and the popup. 
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 * @param  {fa_const} halign   fa_left, fa_center or fa_right
 * @param  {fa_const} valign   fa_top, fa_middle or fa_bottom
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise.
 *
 * @see    scr_dropdown_set_font
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    halign = argument1;
    valign = argument2;
    _scr_dropdown_calcsizes();
    return true;
}

