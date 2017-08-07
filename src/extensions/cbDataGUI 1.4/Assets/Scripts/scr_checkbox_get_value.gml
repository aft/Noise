/// scr_checkbox_get_value(checkbox_instance);
/**
 * @brief  Gets the value of the checbox
 *
 * @param  {checkbox_instance} checkbox_instance    An instance of a checkbox
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns the value
 *
 * @see scr_checkbox_set_value 
 * @see scr_checkbox_toggle_value
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
return o.value;


