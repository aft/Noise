/// scr_textbox_set_color(textbox_instance, [text_normal_color], [text_disabled_color], [cursor_color], [selection_color], [unfocused_selection_color]);
/**
 * @brief  Sets the colors for the textbox. Type -1 for any value you don't want to change.
 *
 * @param  {textbox_instance} textbox_instance   An instance of a textbox
 * @param  {number} [text_normal_color]         Text color for normal state
 * @param  {number} [text_disabled_color]       Text color for disabled state
 * @param  {number} [cursor_color]              Color of the vertical blinking cursor
 * @param  {number} [selection_color]           Color of the selection background
 * @param  {number} [unfocused_selection_color] Color of the selection background for an unfocused textbox
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true if successful
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (argument1 > -1) c_text = argument1;
    if (argument2 > -1) c_text_disabled = argument2;
    if (argument3 > -1) c_cursor = argument3;
    if (argument4 > -1) c_selection = argument4;
    if (argument5 > -1) c_foutselection = argument5;
    return true;
}
