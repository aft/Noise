/// scr_dropdown_set_popup_max_lines(dropdown_instance, num_of_lines);
/**
 * @brief  Sets the maximum number of lines the popup can have 
 *         without the scrollbar appearing. 
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 * @param  {number} num_of_lines    Number of lines
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise.
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _maxLineNo = argument1;
    _scr_dropdown_calcsizes();
    return true;
}
