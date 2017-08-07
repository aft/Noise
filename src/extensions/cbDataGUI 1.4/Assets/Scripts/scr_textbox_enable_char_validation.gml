/// scr_textbox_enable_char_validation(textbox_instance, bool);
/**
 * @brief  Sets space before the text in pixels
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 * @param  {boolean} bool                      True to enable filter, false to disable filter
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns set validateEveryChar value
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    validateEveryChar = argument1;
    return argument1;
}
