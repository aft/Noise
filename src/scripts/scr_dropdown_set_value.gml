/// scr_dropdown_set_value(dropdown_instance, value);
/**
 * @brief  Sets the value of the dropdown. Please note that the value
 *         you are attempting to set MUST be among the options of
 *         the dropdown items. Otherwise it will fail and return false.
 *
 *         If you want to set the dropdown value by the selected line number
 *         use scr_dropdown_set_value_by_line_no
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 * @param  {any} value    Selected item of the dropdown (a.k.a value)
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true if successful, false in unsuccessful.
 *
 * @see    scr_dropdown_get_value
 * @see    scr_dropdown_set_value_by_line_no
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    var ret = _scr_dropdown_setvalue(argument1);
    _changed = false; // prevent cb trigger
    return ret;
}
