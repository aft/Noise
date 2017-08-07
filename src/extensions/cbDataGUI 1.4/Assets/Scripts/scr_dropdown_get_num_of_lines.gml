/// scr_dropdown_get_num_of_lines(dropdown_instance);
/**
 * @brief  Gets how many items the dropdown has.
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 *
 * @return {number} Returns undefined if instance can't be found
 *                   Returns number of items
 *
 * @see    scr_dropdown_is_empty
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
return o._lineNo;

