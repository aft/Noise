/// scr_radio_get_group(radio_instance);
/**
 * @brief  Gets the group id for a radio instance. Groups are way to connect
 *         individual radio instances since only one item can be selected in
 *         the group. When an item is selected, all other radio instances
 *         set to unselected with the same group id.
 *
 * @param  {radio_instance} radio_instance    An instance of a radio
 *
 * @return {number} Returns undefined if instance can't be found. 
 *                   Returns group id as number
 *
 * @see scr_radio_set_group
 */
 
var o = argument0;
if (!instance_exists(o)) return undefined;
return o.group;

