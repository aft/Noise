/// scr_textbox_get_cursor_position(textbox_instance);
/**
 * @brief  Returns the current position of the cursor.
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {number} Returns undefined if instance can't be found
 *                   Returns cursor position
 *
 * @see scr_textbox_set_cursor_position
 * @see scr_textbox_cursor_go_to_start
 * @see scr_textbox_cursor_go_to_end
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    return _cursorPos;
}
