/// scr_textbox_set_indent(textbox_instance, indent);
/**
 * @brief  Sets space before the text in pixels
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 * @param  {number} indent Value to be set
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true if successful
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    indent = argument1;
    _scr_textbox_calcsizes();
    return true;
}
