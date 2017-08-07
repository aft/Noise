///_scr_dropdown_updatekeys();
if (keys == undefined) exit;

// array
if (is_array(keys)) {
    // array found
    var keysSize = array_length_1d(keys);
    var newarr;
    for (var i=0; i < keysSize; i++) {
        newarr[i] = _scr_text_shorten(keys[i], fontPopup, _popupTextW);
    }
    _visibleKeys = newarr;

// ds_map
} else if (ds_exists(keys, ds_type_map)) {
    // ds_map found
    var arr = scr_dsmap_get_keys(keys);
    var keySize = array_length_1d(arr);
    var newarr;
    if (keySize > 0) {
        for (var i=0; i < keySize; i++) {
            newarr[i] = _scr_text_shorten(arr[i], fontPopup, _popupTextW);
        }
        _visibleKeys = newarr;
    }
    
} else {
    show_error("Error: Keys should be an array, a ds_map", true);
}

