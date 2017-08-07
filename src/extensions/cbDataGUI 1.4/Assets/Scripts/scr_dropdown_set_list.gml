/// scr_dropdown_set_list(dropdown_instance, array_or_dsmap);
/**
 * @brief  Sets the list of items the dropdown has. You can use arrays or
 *         ds_maps to set the list. ds_lists are not supported due to some
 *         GMS limitations (don't ask). 
 *
 *         If you use arrays the value and the name of the item will be 
 *         the same. If you use ds_maps, they can be different. So make 
 *         a choice depending on your need. Remember that arrays are 
 *         super-fast compared to ds_maps.
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 * @param  {array_or_dsmap} array_or_dsmap    List of items the dropdown to have
 *
 * @return {boolean} Returns undefined if instance can't be found.
 *                   Returns the set value if successful. Returns false if fails.
 *
 * @see    scr_dropdown_add_to_list
 * @see    scr_dropdown_delete_from_list
 * @see    scr_dropdown_empty_list
 * @see    scr_dropdown_is_empty
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (_scr_dropdown_setkeys(argument1)) return argument1;
    else return false;
}


