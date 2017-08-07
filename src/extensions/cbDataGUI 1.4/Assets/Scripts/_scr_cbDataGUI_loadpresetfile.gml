///_scr_cbDataGUI_loadpresetfile();
// Loads presets.json file
var f = working_directory + _saveDirectory + _jsonFileName;

if (file_exists(f)) {
    _file = file_text_open_read(f);
    if (_scr_cbDataGUI_import_json_string(file_text_read_string(_file))) {
        scr_cbDataGUI_set_notification("Preset file loaded", false);
    }
    file_text_close(_file);
}
