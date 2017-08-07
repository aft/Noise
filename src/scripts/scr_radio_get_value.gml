/// scr_radio_get_value(group_id_int);
/**
 * @brief  Gets the name of the selected radiobox from a group. Note that 
 *         this doesn't return true or false. If you want to check if a
 *         specific instance is selected or not, use 
 *         scr_radio_get_instance_value instead.
 *
 * @param  {number} group_id_int    Group id as unsigned number
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns the name of the selected item if any of them is selected.
 *                   Returns -1 if there is no selected item in the group.
 *
 * @see scr_radio_set_value
 * @see scr_radio_get_instance_value
 * @see scr_radio_set_instance_value
 */
 
var num = instance_number(obj_cbGUI_radio);
if (num <= 0) return undefined;

for (var i=0; i<num; i++) {
    var o = instance_find(obj_cbGUI_radio, i);
    with (o) {
        if (group == real(argument0)) {
            if (value) return name;
        }
    }
}
return -1;

