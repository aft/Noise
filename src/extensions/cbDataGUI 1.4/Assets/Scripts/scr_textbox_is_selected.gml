/// scr_textbox_is_selected(textbox_instance);
/**
 * @brief  Checks if there is an active selection present
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns false if there is no selection
 *                   Returns true if there is one
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    return _selected;
}
