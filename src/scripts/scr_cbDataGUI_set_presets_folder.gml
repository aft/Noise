/// scr_cbDataGUI_set_presets_folder(name_string);
/**
* @brief  Sets the name of the directory for presets to be created in. 
*         This directory is created in the application sandbox path.
*
* @param  {string} name_string  Name of the folder
*         
* @return {Void} Returns nothing. Returns undefined if fails.
*
*/

var fold = argument0;

var p = instance_find(obj_cbDataGUI_preset, 0);
if (!instance_exists(p)) return undefined;

// starts with any char except backslash
while (string_char_at(fold, 0) == "\") {
    fold = string_delete(fold, 0, 1);
}
    
// ends with backslash
if (string_char_at(fold, string_length(fold)) != "\") {
    fold += "\";
}

p._saveDirectory = fold;

return fold;




