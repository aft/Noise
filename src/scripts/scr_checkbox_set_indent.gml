/// scr_checkbox_set_indent(checkbox_instance, indent);
/**
 * @brief  Sets space before the text in pixels
 *
 * @param  {checkbox_instance} checkbox_instance An instance of a checkbox
 * @param  {number} indent Value to be set
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true if successful
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    indent = argument1;
    _scr_checkbox_calcsizes();
    return true;
}
