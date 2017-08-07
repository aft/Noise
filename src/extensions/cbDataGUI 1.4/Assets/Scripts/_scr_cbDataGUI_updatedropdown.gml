///_scr_cbDataGUI_updatedropdown();

// process presets
var arr;

if (ds_list_size(_plist) > 0) {
    for (var i = 0; i < ds_list_size(_plist); i++) {
        arr[i] = ds_map_find_first(_plist[|i]);
    }
    scr_dropdown_set_list(_dropdown, arr);
}

