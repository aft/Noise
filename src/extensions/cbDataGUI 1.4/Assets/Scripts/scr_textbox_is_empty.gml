/// scr_textbox_is_empty(textbox_instance);
/**
 * @brief  Checks whether the textbox is empty or not
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true or false
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (string_length(value) > 0) return false;
    return true;
}
