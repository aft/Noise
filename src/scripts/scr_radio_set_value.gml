/// scr_radio_set_value(group_id, name);
/**
 * @brief  Gets the name of the selected radiobox from a group. Note that 
 *         this doesn't return true or false. If you want to check if a
 *         specific instance is selected or not, use 
 *         scr_radio_get_instance_value instead.
 *
 * @param  {number} group_id_int    Group id as unsigned number
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns the name of the selected item if successful.
 *                   Returns -1 if the item being selected is disabled (also fails the selection).
 *                   Returns false if there is no item with that name in the group.
 *
 * @see scr_radio_set_value
 * @see scr_radio_get_instance_value
 * @see scr_radio_set_instance_value
 */
 
var num = instance_number(obj_cbGUI_radio);
if (num <= 0) return undefined;
var target_name = string(argument1);

var tmp = 0;
for (var i=0; i<num; i++) {
    var o = instance_find(obj_cbGUI_radio, i);
    with (o) {
        if (group == real(argument0)) {
            // turn all of in that group
            _scr_radio_turnalloff();
            // change value if name matches
            if (name == target_name) {
                if (disabled) return -1;
                _scr_radio_setvalue(true);
                _changed = false; // prevent cb trigger
                tmp++;
            }
        }
    }
}
if (tmp > 0) return target_name;
return false;

