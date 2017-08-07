/// scr_cbDataGUI_open_folder(folder_instance, boolean);
/**
* @brief  Opens or closes a folder on the cbDataGUI. All folders
*         are created and set as open by default. If you want to change
*         the state of the folder with this script, you need to pass
*         the folder instance to it as the first argument.
*
* @param  {instance} folder_instance  Folder to be opened/closed
* @param  {boolean}  boolean          True to open, false to close
*
* @see scr_cbDataGUI_add_folder
*/

var obj  = argument0;
var bool = argument1;

if (!instance_exists(obj)) return false;

with (obj) {
    _isOpen = bool;
    
    // if it is a subfolder, get visibility from the parent folder
    // and override the user input.
    if (!is_undefined(obj._folder)) {
        bool = obj._folder._isOpen;
    }
    
    for (var k=0; k < array_length_1d(_folderItems); k++) {
        _scr_cbDataGUI_makevisible(_folderItems[k], bool);
    }
    _scr_cbDataGUI_processrows();
}

return obj;
