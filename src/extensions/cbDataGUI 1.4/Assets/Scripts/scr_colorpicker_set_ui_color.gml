/// scr_colorpicker_set_ui_color(colorpicker_instance, normal_color, focused_color, disabled_color, popup_bg_color, popup_border_color, light_info_text_color, dark_info_text_color);
/**
 * @brief  Sets colors for the color picker UI elements. Use -1 for the 
 *         arguments you want to leave unchanged.
 *
 * @param  {colorpicker_instance} colorpicker_instance An instance of a colorpicker
 * @param  {number} normal_color           Normal state color
 * @param  {number} focused_color          Focused state color
 * @param  {number} disabled_color         Disabled state color
 * @param  {number} popup_bg_color         Popup background color
 * @param  {number} popup_border_color     Popup border color
 * @param  {number} light_info_text_color  Color info text color for dark backgrounds
 * @param  {number} dark_info_text_color   Color info text color for light backgrounds
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise.
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (argument1 > -1) c_normal = argument1;
    if (argument2 > -1) c_focus = argument2;
    if (argument3 > -1) c_disabled = argument3;
    if (argument4 > -1) c_popup_bg = argument4;
    if (argument5 > -1) c_popup_color_border = argument5;
    if (argument6 > -1) c_info_light = argument6;
    if (argument7 > -1) c_info_dark = argument7;
    return true;
}
