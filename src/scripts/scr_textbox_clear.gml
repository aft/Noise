/// scr_textbox_clear(textbox_instance);
/**
 * @brief  Clears the text inside the textbox
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true if successful
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _scr_textbox_setvalue("");
}
return true;

