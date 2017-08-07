/// scr_textbox_get_allowed_chars(textbox_instance);
/**
 * @brief  Sets allowed characters that user can type in the textbox.
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {string}  Returns undefined if instance can't be found
 *                   Returns allowed char list as a string (eg. "ABC")
 *
 * @see    scr_textbox_set_allowed_chars
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    return allowedChars;
}
