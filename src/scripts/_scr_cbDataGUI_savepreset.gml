///_scr_cbDataGUI_savepreset(optional:name_string);

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
            break;
        }
    }
}

if (!found || name == undefined) {
    _scr_cbDataGUI_newpreset();
    exit;
}

var item = _plist[|pos];
if (ds_exists(item, ds_type_map)) ds_map_destroy(item);

var dspresetnew = ds_map_create();
var v = _scr_cbDataGUI_preset_get_values_as_map();
ds_map_add_map(dspresetnew, name, v);
_plist[|pos] = dspresetnew;
ds_list_mark_as_map(_plist, pos);

// set it active preset
_p[? "preset"] = name;

// remove asterix at the end
//scr_dropdown_refresh_list(_dropdown);
_scr_cbDataGUI_updatedropdown();

var _f = _scr_cbDataGUI_savepresetfile();

if (!_saveToFile) scr_cbDataGUI_set_notification("Preset saved to memory", false);
else if (_f) scr_cbDataGUI_set_notification("Preset saved to file", false);
else scr_cbDataGUI_set_notification("Unable to save file", true);
