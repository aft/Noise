/// scr_dropdown_is_empty(dropdown_instance);
/**
 * @brief  Checks if the list of a dropdown box is empty or not.
 *
 * @param  {dropdown_instance} dropdown_instance An instance of a dropdown
 *
 * @return {boolean} Returns undefined if instance can't be found.
 *                   Returns true if empty.
 *                   Returns false if not empty.
 *
 * @see    scr_dropdown_empty_list
 * @see    scr_dropdown_is_empty
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (is_undefined(keys)) return true;
    return false;
}
