/// scr_dropdown_empty_list(dropdown_instance);
/**
 * @brief  Deletes all the items of a dropdown box.
 *
 * @param  {dropdown_instance} dropdown_instance An instance of a dropdown
 *
 * @return {boolean} Returns undefined if instance can't be found.
 *                   Returns true if successful. 
 *                   Returns false if already empty or fails.
 *
 * @see    scr_dropdown_add_to_list
 * @see    scr_dropdown_delete_from_list
 * @see    scr_dropdown_is_empty
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    return _scr_dropdown_emptykeys();
}


