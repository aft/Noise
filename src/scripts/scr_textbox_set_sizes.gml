/// scr_textbox_set_sizes(textbox_instance, width_px, height_px);
/**
 * @brief  Sets the width and the height of the textbox. If you resized
 *         the instance in the room editor, do not use this script.
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 * @param  {number} width_px  Width of the textbox in pixels
 * @param  {number} height_px Height of the textbox in pixels
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _bodyW = argument1;
    _bodyH = argument2;
    image_xscale = 1;
    image_yscale = 1;
    _scr_textbox_calcsizes();
    return true;
}
    

