/// scr_textbox_set_value(textbox_instance, string);
/**
 * @brief  Sets the text of the textbox
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 * @param  {string} string Value to be set
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns the set value if successful
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _scr_textbox_setvalue(argument1);
    _changed = false; // prevent cb trigger
    return argument1;
}


