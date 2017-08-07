/// scr_radio_set_label(radio_instance, label_str);
/**
 * @brief  Sets the label for a radio instance. Labels are the descriptive
 *         text on the right side of the radioboxes. You may set it to
 *         undefined if you don't want it to show.
 *
 * @param  {radio_instance} radio_instance    An instance of a radio
 * @param  {string}         label_str         Label of the radio instance
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns the newly set label otherwise
 *
 * @note Labels have no function other than being drawn on DRAW GUI action.
 *       They are not checked or processed on any other part of the code.
 *
 * @see scr_radio_get_label
 */
 
var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    label = argument1;
    return label;
}

