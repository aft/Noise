///_scr_cbDataGUI_savepresetfile();
// Saves presets.json file

// clean up
if (ds_list_size(_plist) == 0) {
    if (file_exists(working_directory + _saveDirectory + _jsonFileName)) {
        file_delete(working_directory + _saveDirectory + _jsonFileName);
    }
    
    if (file_find_first(working_directory + _saveDirectory + "*.*", 0) == "") {
        show_debug_message("Empty directory found. Deleting it.");
        directory_destroy(working_directory + _saveDirectory);
    }
    
    exit;
}

if (!_saveToFile) exit;

if (_saveDirectory != "\") {
    if (!directory_exists(_saveDirectory)) directory_create(_saveDirectory);
}

_file = file_text_open_write(working_directory + _saveDirectory + _jsonFileName);

if (_file) {

    var content = _scr_cbDataGUI_getpresetcode();
    
    if (ds_exists(content, ds_type_map)) {
        show_debug_message("Saving to: " + working_directory + _saveDirectory + _jsonFileName);
        file_text_write_string(_file, content);
    }
    
    file_text_close(_file);
    
    return true;
    
} else {
    return false;
}

