/// scr_cbDataGUI_delete_preset(optional:name_string);
/**
* @brief  Deletes a preset. If no preset name is given, it will delete the
*         preset currently selected on the presets dropdown box.
*
* @param  {string} [name_string]  Name of the preset to delete
*         
* @return {Void} Returns false if preset not found. Returns true if successful. 
*                Returns undefined if fails for any other reason.
*
* @see scr_cbDataGUI_add_preset
* @see scr_cbDataGUI_save_preset
* @see scr_cbDataGUI_load_preset
*/

var p = instance_find(obj_cbDataGUI_preset, 0);
if (!instance_exists(p)) return undefined;

with (p) {
    if (argument_count > 0) return _scr_cbDataGUI_delpreset(argument[0]);
    return _scr_cbDataGUI_delpreset();
}



