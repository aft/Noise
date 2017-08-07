/// scr_cbDataGUI_add_preset([optional:name_string]);
/**
* @brief  Adds a new preset to the presets list with the current row values.
*         The preset name argument is optional. If no name is passed, the
*         new preset name will be "Default". If there is a preset with the
*         same name as you are adding, underscore (_) will be added to the
*         end of the new name.
*
* @param  {string} [name_string]  Name of the new preset
*         
* @return {Void} Returns nothing. Returns undefined if fails.
*
* @see scr_cbDataGUI_save_preset
* @see scr_cbDataGUI_load_preset
* @see scr_cbDataGUI_delete_preset
*/

var p = instance_find(obj_cbDataGUI_preset, 0);
if (!instance_exists(p)) return undefined;

with (p) {
    if (argument_count > 0) _scr_cbDataGUI_newpreset(argument[0]);
    else _scr_cbDataGUI_newpreset();
}



