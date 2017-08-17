/// scr_radio_get_instance_value(radio_instance);
/**
 * @brief  Gets the value of an radio insance. Note that this doesn't 
 *         return the selected item in the group. Just gets the value
 *         from the specified instance. Use scr_radio_get_value to
 *         determine which radio is selected in a group.
 *
 * @param  {radio_instance} radio_instance    An instance of a radio
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true if selected, false if not selected.
 *
 * @see scr_radio_set_value
 * @see scr_radio_get_value
 * @see scr_radio_set_instance_value
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
return o.value;

