/// scr_cbDataGUI_get_preset_json([copy_to_clipboard?_boolean]);
/**
* @brief  Gets the presets as a JSON string and returns. If no argument is
*         passed or true is given it also copies the string to the clipboard.
*         Use false to disable clipboard step. Disabling this step will also
*         prevent cbDataGUI to show a notification about it.
*
* @param  {boolean} [copy_to_clipboard_boolean]  Leave blank or true for 
*                                                auto-copy to clipboard.
*         
* @return {String} Returns false if no preset found. 
*                  Returns string if successful. 
*                  Returns undefined if fails for any other reason.
*
* @see scr_cbDataGUI_add_preset
* @see scr_cbDataGUI_save_preset
* @see scr_cbDataGUI_load_preset
* @see scr_cbDataGUI_delete_preset
* @see scr_cbDataGUI_import_preset_json
*/


var p = instance_find(obj_cbDataGUI_preset, 0);
if (!instance_exists(p)) return undefined;

with (p) {
    if (ds_list_size(_plist) > 0) {
        var str = _scr_cbDataGUI_getpresetcode();
        if (argument_count > 0) {
            if (argument[0]) {
                clipboard_set_text(str);
                scr_cbDataGUI_set_notification("JSON copied to clipboard", false);
            }
        }
        return str;
    } else {
        scr_cbDataGUI_set_notification("No presets found", true);
        return false;
    }
}

