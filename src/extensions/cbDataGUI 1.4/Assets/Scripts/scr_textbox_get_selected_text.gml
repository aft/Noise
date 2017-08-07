/// scr_textbox_get_selected_text(textbox_instance);
/**
 * @brief  Returns the selected text as a string if there is a selection
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {string}  Returns undefined if instance can't be found
 *                   Returns undefined if there is no selection
 *                   Returns string if there is a successful selection
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (_selected) {
        return _scr_textbox_getselectedtext();
    }
    return undefined;
}
