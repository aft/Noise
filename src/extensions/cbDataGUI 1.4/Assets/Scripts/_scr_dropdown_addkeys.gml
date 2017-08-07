///_scr_dropdown_addkeys(single||array||ds_map);
var item = argument0;

if (is_undefined(keys)) {
    if (is_array(item)) { //if (typeof(item) == "array") {
        keys = item;
    } else {
        // if (typeof(item) != "string" && ds_exists(item, ds_type_map)) {
        if (!is_string(item) && ds_exists(item, ds_type_map)) {
            keys = ds_map_create();
        } else if (is_string(item) || is_real(item) || is_bool(item)) {
            keys[0] = item;
        }
    }
    _scr_dropdown_updatekeys();
    _scr_dropdown_setpopup();
    return true;
}

// array
if (is_array(keys)) {
    // array
     if (is_array(item)) { // if (typeof(item) == "array") {
        keys = array_concat_1d(keys, item);
        _scr_dropdown_updatekeys();
        
    // ds_map found    
    } else {
        // if (typeof(item) != "string" && ds_exists(item, ds_type_map)) {
        if (!is_string(item) && ds_exists(item, ds_type_map)) {
            var arr = scr_dsmap_get_values(item);
            keys = array_concat_1d(keys, arr);
            _scr_dropdown_updatekeys();
    
        // string, number, boolean
        } else if (is_string(item) || is_real(item) || is_bool(item)) {
            var keysSize = array_length_1d(keys);
            keys[@keysSize] = item;
            _scr_dropdown_updatekeys();
        }
    }

// ds_map
} else if (ds_exists(keys, ds_type_map)) {
    // array
    if (is_array(item)) { // if (typeof(item) == "array") {
        var keySize = array_length_1d(item);
        if (keySize > 0) {
            for (var i=0; i < keySize; i++) {
                ds_map_add(keys, item[i], item[i]);
            }
            _scr_dropdown_updatekeys(); 
        }

    // ds_map found    
    } else {
        // if (typeof(item) != "string" && ds_exists(item, ds_type_map)) {
        if (!is_string(item) && ds_exists(item, ds_type_map)) {
            var arr = scr_dsmap_get_keys(item);
            var keySize = array_length_1d(arr);
            if (keySize > 0) {
                for (var i=0; i < keySize; i++) {
                    var k = arr[@i];
                    var v = ds_map_find_value(item, k);
                    ds_map_add(keys, string(k), v);
                }
                _scr_dropdown_updatekeys();
            }

        // string, number, boolean
        } else if (is_string(item) || is_real(item) || is_bool(item)) {
            ds_map_add(keys, string(item), item);
            _scr_dropdown_updatekeys();
        }
    }
    
} else {
    show_error("Error: Keys should be an array, or a ds_map", false);
    return false;
}

_scr_dropdown_setpopup();
return true;

