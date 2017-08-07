/// scr_button_set_label(button_object, label);
/**
 * @brief  Sets the text on the button. If you don't want to use labels
 *         you can turn them off with scr_button_enable_label per instance.
 *
 * @param  {button_instance} button_instance    An instance of a button
 * @param  {string} label    Button text as string
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 *
 * @see scr_button_enable_label
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _scr_button_setlabel(argument1);
    return true;
}
