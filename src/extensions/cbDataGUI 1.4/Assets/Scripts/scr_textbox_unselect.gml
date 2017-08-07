/// scr_textbox_unselect(textbox_instance);
/**
 * @brief  Cancels any active text selection
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _scr_textbox_unselect();
    return true;
}
