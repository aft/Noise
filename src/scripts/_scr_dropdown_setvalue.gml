//_scr_dropdown_setvalue(value);
var val = argument0;
var tmp = 0;
// array
if (is_array(keys)) {
    // array found
    var keysSize = array_length_1d(keys);
    for (var i=0; i < keysSize; i++) {
        if (keys[@ i] == val) {
            // val found in the array
            _scr_dropdown_setvaluebyitemno(i);
            tmp++;
            break;
        }
    }

// ds_map
} else if (!is_array(keys) && ds_exists(keys, ds_type_map)) {
    // ds_map found
    var arr = scr_dsmap_get_keys(keys);
    var keySize = array_length_1d(arr);
    if (keySize > 0) {
        for (var i=0; i < keySize; i++) {
            if (ds_map_find_value(keys, arr[@ i]) == val) {
                // val found in the array
                _scr_dropdown_setvaluebyitemno(i);
                tmp++
                break;
            }
        }
    }
    
}

if (tmp > 0) {
    _scr_dropdown_setpopup();
    return true;
} else return false;

