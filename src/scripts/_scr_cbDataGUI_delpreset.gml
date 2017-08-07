///_scr_cbDataGUI_delpreset(optional:name_string);

// in case working folder is modified outside the app.
_scr_cbDataGUI_updatedropdown();

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
    scr_cbDataGUI_set_notification("Preset " + string(name) + " not found", true);
    return false;
}

// remove from dropdown
var todelete = ds_map_find_first(_plist[|pos]);
if (!is_undefined(todelete)) {
    scr_dropdown_delete_from_list(_dropdown, todelete);
}

// delete the preset
ds_map_destroy(_plist[|pos]);
ds_list_delete(_plist, pos);

// check if there is a previous preset
if (!is_undefined(ds_list_find_value(_plist, pos-1))) {
    // set the previous preset active one
    var itemname = ds_map_find_first(_plist[|pos-1]);
    _p[? "preset"] = itemname;
    scr_dropdown_set_value(_dropdown, itemname);
    // Load previous preset
    scr_cbGUI_mark_as_changed(_dropdown);
} else if (!is_undefined(ds_list_find_value(_plist, 0))) {
    // there is no previous preset if the first one is deleted
    var itemname = ds_map_find_first(_plist[|0]);
    _p[? "preset"] = itemname;
    scr_dropdown_set_value(_dropdown, itemname);
    // Load first found preset
    scr_cbGUI_mark_as_changed(_dropdown);
} else {
    scr_dropdown_unselect(_dropdown);
}

_scr_cbDataGUI_savepresetfile();

scr_cbDataGUI_set_notification("Preset removed", false);
return true;
