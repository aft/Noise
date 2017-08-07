/// scr_textbox_cursor_go_to_end(textbox_instance);
/**
 * @brief  Moves the cursor to the end.
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {number} Returns undefined if instance can't be found
 *                  Returns new cursor position
 *
 * @see scr_textbox_get_cursor_position
 * @see scr_textbox_set_cursor_position
 * @see scr_textbox_cursor_go_to_start
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _scr_textbox_gotoend();
    return _cursorPos;
}
