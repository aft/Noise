/// scr_button_set_color(button_object, label_color, hover_color, pressed_color, disabled_color);
/**
 * @brief  Sets the color of the labels for several states. Use -1 for arguments 
 *         you don't want to modify.
 *
 * @param  {button_instance} button_instance    An instance of a button
 * @param  {number} label_color     Label color in normal state
 * @param  {number} hover_color     Label color in hover state
 * @param  {number} pressed_color   Label color in pressed state
 * @param  {number} disabled_color  Label color for a disabled button
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (argument1 > -1) c_label = argument1;
    if (argument2 > -1) c_flabel = argument2;
    if (argument3 > -1) c_pressed = argument3;
    if (argument4 > -1) c_disabledLabel = argument4;
    return true;
}
