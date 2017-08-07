///_scr_dropdown_setkeys(array_or_dsmap);
var obj = argument0;

// proper reset for keys 
if (is_real(keys)) { //if (typeof(keys) == "number") {
    //if (ds_exists(keys, ds_type_list)) ds_list_destroy(keys);
    if (ds_exists(keys, ds_type_map))  ds_map_destroy(keys);
    keys = -1;
}

// array
if (is_array(obj)) {
    // array found
    keys = obj;
    var keysSize = array_length_1d(keys);
    var newarr;
    for (var i=0; i < keysSize; i++) {
        newarr[i] = _scr_text_shorten(keys[i], fontPopup, _popupTextW);
    }
    _visibleKeys = newarr;
/*
// CANNOT SUPPORT BOTH DSLIST AND DSMAP AT THE SAME TIME.
// BECAUSE GMS CANNOT DIFFERENTIATE BETWEEN LIST AND A MAP PROGRAMATICALLY.

// ds_list
} else if (!is_array(obj) && ds_exists(obj, ds_type_list)) {
    // ds_list found
    keys = ds_list_create();
    ds_list_copy(keys, obj);
    
    var keysSize = ds_list_size(keys);
    _visibleKeys[keysSize] = 0;
    for (var i=0; i < keysSize; i++) {
        _visibleKeys[i] = _scr_text_shorten(ds_list_find_value(keys, i), fontPopup, _popupTextW);
    }
*/

// ds_map
} else if (!is_array(obj) && ds_exists(obj, ds_type_map)) {
    // ds_map found
    keys = ds_map_create();
    ds_map_copy(keys, obj);
    
    var arr = scr_dsmap_get_keys(obj);
    var keySize = array_length_1d(arr);
    var newarr;
    if (keySize > 0) {
        for (var i=0; i < keySize; i++) {
            newarr[i] = _scr_text_shorten(arr[i], fontPopup, _popupTextW);
        }
        _visibleKeys = newarr;
    }
    
} else {
    show_error("Error: Keys should be an array, or a ds_map", false);
    return false;
}

_scr_dropdown_setpopup();
return true;

/*
if (is_array(obj)) {
    // array found
} else if (ds_exists(obj, ds_type_list)) {
    // ds_list found
} else if (ds_exists(obj, ds_type_map)) {
    // ds_map found
}
*/
