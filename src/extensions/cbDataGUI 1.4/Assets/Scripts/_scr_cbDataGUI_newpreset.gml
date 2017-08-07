///_scr_cbDataGUI_newpreset(optional:name_string);

var name;
if (argument_count > 0) {
    name = argument[0];
} else {
    // get string
    name = get_string("Enter a preset name:", "Default");
}

// check duplicate
while (_scr_cbDataGUI_haspreset(name)) name = name + "_";

// check empty
if (name != "") {
    // save to the preset
    var pos = ds_list_size(_plist) - 1;
    pos = max(0, pos);
    var dspreset = ds_map_create();
    var v = _scr_cbDataGUI_preset_get_values_as_map();
    //show_debug_message("New preset: " + name + " " + json_encode(v));
    ds_map_add_map(dspreset, name, v);
    ds_list_add(_plist, dspreset);
    ds_list_mark_as_map(_plist, ds_list_find_index(_plist, dspreset));
    
    // set it active preset
    _p[? "preset"] = name;
    
    // add it to the dropdown
    //scr_dropdown_add_to_list(_dropdown, name);
    _scr_cbDataGUI_updatedropdown();
    scr_dropdown_set_value(_dropdown, name);
    
    scr_cbDataGUI_set_notification("Preset created", false);
    
} else {
    // TODO proper notification
    scr_cbDataGUI_set_notification("Preset name empty", true);
    show_debug_message("Preset name cannot be empty");
}



