/// scr_checkbox_get_label(checkbox_instance);
/**
 * @brief  Gets the label for a checkbox instance. Labels are the descriptive
 *         text on the right side of the checkboxboxes. You may set it to
 *         undefined if you don't want it to show.
 *
 * @param  {checkbox_instance} checkbox_instance    An instance of a checkbox
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns the label otherwise
 *
 * @note Labels have no function other than being drawn on DRAW GUI action.
 *       They are not checked or processed on any other part of the code.
 *
 * @see scr_checkbox_set_label
 */
 
var o = argument0;
if (!instance_exists(o)) return undefined;
return o.label;
