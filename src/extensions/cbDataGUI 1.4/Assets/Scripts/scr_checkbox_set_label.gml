/// scr_checkbox_set_label(checkbox_instance, label_str);
/**
 * @brief  Sets the label for a checkbox instance. Labels are the descriptive
 *         text on the right side of the checkboxes. You may set it to
 *         undefined if you don't want it to show.
 *
 * @param  {checkbox_instance} checkbox_instance    An instance of a checkbox
 * @param  {string}         label_str         Label of the checkbox instance
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns the newly set label otherwise
 *
 * @note Labels have no function other than being drawn on DRAW GUI action.
 *       They are not checked or processed on any other part of the code.
 *
 * @see scr_checkbox_get_label
 */
 
var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    label = argument1;
    return label;
}

