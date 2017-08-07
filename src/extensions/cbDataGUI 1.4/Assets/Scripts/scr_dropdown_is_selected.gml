/// scr_dropdown_is_selected(dropdown_instance);
/**
 * @brief  Checks whether the user has selected anything from the dropdown box
 *         or not.
 *
 * @param  {dropdown_instance} dropdown_instance An instance of a dropdown
 *
 * @return {boolean} Returns undefined if instance can't be found.
 *                   Returns true if yes. 
 *                   Returns false if no.
 *
 * @see    scr_dropdown_set_value
 * @see    scr_dropdown_set_value_by_line_no
 * @see    scr_dropdown_unselect
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (is_undefined(value)) return true;
    return false;
}
