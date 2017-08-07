/// scr_textbox_delete_selected_text(textbox_instance);
/**
 * @brief  Deletes the selected text if there is a selection
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {string}  Returns undefined if instance can't be found
 *                   Returns undefined if there is no selection
 *                   Returns the deleted string if successful
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (_selected) {
        var selected_text = _scr_textbox_getselectedtext();
        _scr_textbox_remove();
        return selected_text;
    }
    return undefined;
}
