/// scr_textbox_is_selection_started(textbox_instance);
/**
 * @brief  Checks if the user is started a selection. If selection is started,
 *         by the user, this returns true until the user releases the left 
 *         mouse button.
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true or false 
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    return _selectionStarted;
}
