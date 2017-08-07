/// scr_textbox_insert_text(textbox_instance, string);
/**
 * @brief  Inserts a string to the cursor position shifting the text that comes after it
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 * @param  {string} string String to be inserted
 *
 * @return {string} Returns undefined if instance can't be found
 *                  Returns the inserted string if successful
 *
 * @note Make sure where the cursor is before inserting a text.
 *
 * @see scr_textbox_get_cursor_position
 * @see scr_textbox_set_cursor_position
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    // TODO Add char validation
    var text = string(argument1);
    _scr_textbox_inserttext(text);
    return text;
}
