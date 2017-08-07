/// scr_checkbox_set_value(checkbox_instance, boolean);
/**
 * @brief  Sets the value of the checbox
 *
 * @param  {checkbox_instance} checkbox_instance    An instance of a checkbox
 * @param  {boolean} boolean   Set true for checked, false for unchecked
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns the new value
 *
 * @see scr_checkbox_get_value
 * @see scr_checkbox_toggle_value
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _scr_checkbox_setvalue(argument1);
    _changed = false; // prevent cb trigger
    return argument1;
}

