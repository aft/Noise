/// scr_textbox_get_selection_start(textbox_instance);
/**
 * @brief  If there is a selection, returns the starting char number of the selection
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {number}  Returns undefined if instance can't be found
 *                   Returns unsigned number if there is a selection
 *                   Returns -1 if there is no selection
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    // make selection if numbers are different
    if (_selected && _selection[@0] != _selection[@1]) {
        return _selection[@0];
    }
    return -1;
}
