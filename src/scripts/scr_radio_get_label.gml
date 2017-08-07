/// scr_radio_get_label(radio_instance);
/**
 * @brief  Gets the label for a radio instance. Labels are the descriptive
 *         text on the right side of the radioboxes. You may set it to
 *         undefined if you don't want it to show.
 *
 * @param  {radio_instance} radio_instance    An instance of a radio
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns the label otherwise
 *
 * @note Labels have no function other than being drawn on DRAW GUI action.
 *       They are not checked or processed on any other part of the code.
 *
 * @see scr_radio_set_label
 */
 
var o = argument0;
if (!instance_exists(o)) return undefined;
return o.label;
