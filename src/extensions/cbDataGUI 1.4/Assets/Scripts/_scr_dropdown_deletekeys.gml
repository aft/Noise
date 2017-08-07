///_scr_dropdown_deletekeys(single);
var item = argument0;
if (keys == undefined) return true;

// array
if (is_array(keys) && array_length_1d(keys) > 1) {
    var arr;
    var found = false;
    var j = 0;
    for (var i = 0; i < array_length_1d(keys); i++) {
        if (keys[@i] != item) {
            arr[j] = keys[@i];
            j++;
        } else {
            found = true;
        }
    }
    _scr_dropdown_setkeys(arr);
    
    if (found) {
        _scr_dropdown_updatekeys();
        _scr_dropdown_setpopup();
    }
    return found;

// ds_map
} else if (!is_array(keys) && ds_exists(keys, ds_type_map)) {

    if (ds_map_exists(keys, item)) {
        ds_map_delete(keys, item);
        
        if (ds_map_size(keys) <= 0) _scr_dropdown_emptykeys();
        
        _scr_dropdown_updatekeys();
        _scr_dropdown_setpopup();
        return true;
    } else {
        return false;
    }

} else {
    _scr_dropdown_emptykeys();
    _scr_dropdown_updatekeys();
    _scr_dropdown_setpopup();
    return true;
}
