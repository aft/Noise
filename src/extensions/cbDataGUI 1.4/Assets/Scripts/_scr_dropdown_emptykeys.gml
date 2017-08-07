///_scr_dropdown_emptykeys();

if (keys == undefined) {
    _visibleKeys = undefined;
    return false;
}

// array
if (is_array(keys)) {

    keys = undefined;
    _visibleKeys = undefined;
    _visibleKeyOnDropdown = undefined;
    value = undefined;
    _hover = -1;
    _changed = true;
    _modifyTarget = true;
    return true;
    
// ds_map
} else if (ds_exists(keys, ds_type_map)) {

    ds_map_destroy(keys);
    keys = undefined;
    _visibleKeys = undefined;
    _visibleKeyOnDropdown = undefined;
    value = undefined;
    _hover = -1;
    _changed = true;
    _modifyTarget = true;
    return true;

} else {
    show_error("Error: Keys should be an array, or a ds_map", false);
    return false;
}
