/// scr_textbox_get_value(textbox_instance);
/**
 * @brief  Gets the text of the textbox
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {string} Returns string if a value is present. If not, returns undefined.
 */
 
var o = argument0;
if (!instance_exists(o)) return undefined;
return o.value;

