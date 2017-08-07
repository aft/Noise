/// scr_cbDataGUI_save_preset([optional:name_string]);
/**
* @brief  Saves the current cbDataGUI values to the active preset. If there
*         if no active preset, the new one will be created. The name of the
*         automatically created preset will be "Default".
*
* @param  {string} [name_string]  Name of the preset to save
*         
* @return {Void} Returns nothing. Returns undefined if fails.
*
* @see scr_cbDataGUI_add_preset
* @see scr_cbDataGUI_load_preset
* @see scr_cbDataGUI_delete_preset
*/

var p = instance_find(obj_cbDataGUI_preset, 0);
if (!instance_exists(p)) return undefined;

with (p) {
    if (argument_count > 0) _scr_cbDataGUI_savepreset(argument[0]);
    else _scr_cbDataGUI_savepreset();
}


