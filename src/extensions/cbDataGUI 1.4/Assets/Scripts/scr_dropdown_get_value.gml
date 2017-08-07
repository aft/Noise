/// scr_dropdown_get_value(dropdown_instance);
/**
 * @brief  Gets the value of the dropdown if there is an item 
 *         selected by the user.
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns the value if user has selected any line
 *                   Returns undefined if no selection
 *
 * @see    scr_dropdown_set_value
 * @see    scr_dropdown_set_value_by_line_no
 * @see    scr_dropdown_is_selected
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
return o.value;

