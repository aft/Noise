///scr_button_set_font_align(button_object, halign, valign);
/**
 * @brief  Sets horizontal and vertical alignment for the label. Leave
 *         them unchanged if you don't use labels. For horizontal you
 *         can use fa_left, fa_center, fa_right; for vertical you can
 *         use fa_top, fa_middle, fa_bottom.
 *
 * @param  {button_instance} button_instance    An instance of a button
 * @param  {gms_constant} halign  Horizontal alignment constant
 * @param  {gms_constant} valign  Vertical alignment constant
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    halign = argument1;
    valign = argument2;
    _scr_button_calcsizes();
    return true;
}
