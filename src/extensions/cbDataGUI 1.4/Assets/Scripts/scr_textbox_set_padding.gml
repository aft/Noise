/// scr_textbox_set_padding(textbox_instance, padding);
/**
 * @brief  Sets the spacing between the border and the content of the textbox in pixels
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 * @param  {number} padding Space in pixels
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true if successful
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    padding = argument1;
    _scr_textbox_calcsizes();
    return true;
}
