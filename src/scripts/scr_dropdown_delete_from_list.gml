/// scr_dropdown_delete_from_list(dropdown_instance, single);
/**
 * @brief  Deletes an item from the dropdown list. You don't need to use 
 *         scr_dropdown_refresh_list after adding or deleting an item.
 *         You also have the option to delete all items by using 
 *         scr_dropdown_empty_list.
 *
 * @param  {dropdown_instance} dropdown_instance An instance of a dropdown
 * @param  {any} single    Item to be deleted from the list
 *
 * @return {boolean} Returns undefined if instance can't be found.
 *                   Returns the deleted value if successful. 
 *                   Returns false if fails.
 *
 * @see    scr_dropdown_add_to_list
 * @see    scr_dropdown_empty_list
 * @see    scr_dropdown_is_empty
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    return _scr_dropdown_deletekeys(argument1);
}

