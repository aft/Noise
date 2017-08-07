/// scr_textbox_set_cursor_position(textbox_instance, int);
/**
 * @brief  Moves the cursor to the given position. A negative value 
 *         puts the cursor to 0 position. Floats are floored.
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 * @param  {number} int New cursor position as an unsigned number value
 *
 * @return {number} Returns undefined if instance can't be found
 *                  Returns new cursor position
 *
 * @see scr_textbox_get_cursor_position
 * @see scr_textbox_cursor_go_to_start
 * @see scr_textbox_cursor_go_to_end
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    return _scr_textbox_setcursorpos(argument1);
}
