/// scr_textbox_set_allowed_chars(textbox_instance, string);
/**
 * @brief  Sets allowed characters that user can type in the textbox.
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 * @param  {string} string                     Char list as a string (eg. "ABC")
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true if successful
 *
 * @note   Note that this resets the allowedChars value everytime you 
 *         set something. It doesn't append to it.
 *
 * @see    scr_textbox_get_allowed_chars
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    allowedChars = argument1;
    return true;
}
