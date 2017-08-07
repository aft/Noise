/// scr_textbox_get_text_length(textbox_instance);
/**
 * @brief  Returns the length (number of chars) of the textbox text
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {number} Returns undefined if instance can't be found
 *                  Returns unsigned number if successful
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    return _txtLen;
}
