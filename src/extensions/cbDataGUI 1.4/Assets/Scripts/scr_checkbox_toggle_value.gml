/// scr_checkbox_toggle_value(checkbox_instance);
/**
 * @brief  Switches the value to the opposite.
 *
 * @param  {checkbox_instance} checkbox_instance    An instance of a checkbox
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns the new value
 *
 * @see scr_checkbox_set_value 
 * @see scr_checkbox_get_value
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
with (o) {
    var ret = _scr_checkbox_togglevalue();
    _changed = false; // prevent cb trigger
    return ret;
}


