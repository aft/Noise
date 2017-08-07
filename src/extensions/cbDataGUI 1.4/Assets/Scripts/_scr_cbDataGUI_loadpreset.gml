///_scr_cbDataGUI_loadpreset(optional:name_string);

if (scr_dropdown_is_empty(_dropdown)) return undefined;

var name;

if (argument_count > 0) {
    name = argument[0];
} else {
    name = scr_dropdown_get_value(_dropdown);
}

// find the preset
var pos;
var found = false;
if (ds_list_size(_plist) > 0) {
    for (pos = 0; pos < ds_list_size(_plist); pos++) {
        if (ds_map_find_first(_plist[|pos]) == name) {
            found = true;
            //show_debug_message("Pos found: " + string(pos) + " with name: " + string(name));
            break;
        }
    }
}

if (!found) {
    //_scr_cbDataGUI_newpreset(name);
    scr_cbDataGUI_set_notification("No preset named "+ string(name)+" found", false);
    return false;
}

var item = _plist[|pos];
if (ds_exists(item, ds_type_map)) {
    var itemkey = ds_map_find_first(item);
    _scr_cbDataGUI_preset_set_values_from_map(item[? itemkey]);
} else {
    scr_cbDataGUI_set_notification("TODO", false);
}

scr_cbDataGUI_set_notification("Reverted to preset", false);
return true;
