/// scr_radio_group_unselect_all(group_id_int);
/**
 * @brief  Unselects all radio elements in a specified group.
 *
 * @param  {group_id_int} group_id_int    Group id as an number
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true if successful.
 *                   Returns false if unsuccessful.
 *
 * @see scr_checkbox_get_value
 * @see scr_checkbox_toggle_value
 */
 
var num = instance_number(obj_cbGUI_radio);
if (num <= 0) return undefined;

var tmp = 0;
for (var i=0; i<num; i++) {
    var o = instance_find(obj_cbGUI_radio, i);
    with (o) {
        if (group == real(argument0)) {
            _scr_radio_setvalue(false);
            tmp++;
        }
    }
}
if (tmp > 0) return true;
return false;

