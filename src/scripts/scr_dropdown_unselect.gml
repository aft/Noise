/// scr_dropdown_unselect(dropdown_instance);
/**
 * @brief  Unselects any item that user may have selected from the dropdown box.
 *
 * @param  {dropdown_instance} dropdown_instance An instance of a dropdown
 *
 * @return {Void} Nothing.
 *
 * @see    scr_dropdown_set_value
 * @see    scr_dropdown_set_value_by_line_no
 * @see    scr_dropdown_is_selected
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _visibleKeyOnDropdown = undefined;
    value = undefined;
    _hover = -1;
    // _changed = true; // prevent cb trigger
}
