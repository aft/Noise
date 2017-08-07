/// scr_dropdown_add_to_list(dropdown_instance, single_or_array_or_dsmap);
/**
 * @brief  Adds an item to the list dynamically. You can add multiple 
 *         items by using arrays or ds_maps. Only use ds_maps if you set 
 *         the list with a ds_map previously. You don't need to use 
 *         scr_dropdown_refresh_list after adding or deleting an item.
 *
 * @param  {dropdown_instance} dropdown_instance An instance of a dropdown
 * @param  {any} single_or_array_or_dsmap    Item(s) to add to the list
 *
 * @return {boolean} Returns undefined if instance can't be found.
 *                   Returns the added value if successful. 
 *                   Returns false if fails.
 *
 * @see    scr_dropdown_delete_from_list
 * @see    scr_dropdown_empty_list
 * @see    scr_dropdown_is_empty
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (_scr_dropdown_addkeys(argument1)) return argument1;
    return false;
}

