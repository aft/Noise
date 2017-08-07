/// scr_dropdown_set_color(dropdown_instance, body_normal_text, body_focus_text, body_disabled_text, popup_normal_text, popup_hover_text, scrollbar_background, scrollbar_body);
/**
 * @brief  Sets the colors of the dropdown box and its elements. Use -1
 *         for the arguments you want to leave unchanged.
 *
 * @param  {dropdown_instance} dropdown_instance An instance of a dropdown
 * @param  {color} body_normal_text     Body normal text color
 * @param  {color} body_focus_text      Body on focus text color
 * @param  {color} body_disabled_text   Body disabled dropdown text color
 * @param  {color} popup_normal_text    Popup normal text color
 * @param  {color} popup_hover_text     Popup hover text color
 * @param  {color} scrollbar_background Scrollbar background color
 * @param  {color} scrollbar_body       Scrollbar body color
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise.
 *
 * @see    scr_dropdown_add_to_list
 * @see    scr_dropdown_delete_from_list
 * @see    scr_dropdown_empty_list
 * @see    scr_dropdown_is_empty
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (argument1 > -1) c_text = argument1;
    if (argument2 > -1) c_fText = argument2;
    if (argument3 > -1) c_disabledText = argument3;
    if (argument4 > -1) c_text_popup_normal = argument4;
    if (argument5 > -1) c_text_popup_hover = argument5;
    if (argument6 > -1) c_popup_hover = argument6;
    if (argument7 > -1) c_scrollbar_bg = argument7;
    if (argument8 > -1) c_scrollbar = argument8;
    return true;
}

