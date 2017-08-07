/// scr_radio_set_group(radio_instance, group_id_int);
/**
 * @brief  Sets the group id for a radio instance. Groups are way to connect
 *         individual radio instances since only one item can be selected in
 *         the group. When an item is selected, all other radio instances
 *         set to unselected with the same group id.
 *
 * @param  {radio_instance} radio_instance    An instance of a radio
 * @param  {number}        group_id_int      Group id as unsigned number
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise.
 *
 * @see scr_radio_get_group
 */
 
var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    group = real(argument1);
    return true;
}

