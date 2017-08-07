/// scr_cbDataGUI_load_preset(optional:name_string);
/**
* @brief  Loads the values from a preset to cbDataGUI.
*
* @param  {string} [name_string]  Name of the new preset
*         
* @return {Boolean} Returns false if preset not found. Returns true if successful. 
*                   Returns undefined if fails for any other reason.
*
* @see scr_cbDataGUI_add_preset
* @see scr_cbDataGUI_save_preset
* @see scr_cbDataGUI_delete_preset
*/

var p = instance_find(obj_cbDataGUI_preset, 0);
if (!instance_exists(p)) return undefined;

with (p) {
    if (argument_count > 0) return _scr_cbDataGUI_loadpreset(argument[0]);
    return _scr_cbDataGUI_loadpreset();
}



