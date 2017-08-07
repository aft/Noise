///_scr_dropdown_setvaluebyitemno(itemno_int);
if (is_undefined(keys)) return undefined;

//var item = argument0 + _lineOffset;
var item = min(argument0 + _lineOffset, _lineNo); // clamping
_hover = argument0;

// array found
if (is_array(keys)) {
    if (keys[item] != value) {
        value = keys[item];
        _visibleKeyOnDropdown = _scr_text_shorten(string(value), fontBody, _bodyTextW);
        _changed = true;
        _modifyTarget = true;
    }

/*
// ds_list found
} else if (ds_exists(keys, ds_type_list)) {
    if (ds_list_find_value(keys, item) != value) {
        value = ds_list_find_value(keys, item);
        _visibleKeyOnDropdown = _scr_text_shorten(string(value), fontBody, _bodyTextW);
        _changed = true;
        _modifyTarget = true;
    }
*/

// ds_map found    
} else if (ds_exists(keys, ds_type_map)) {
    var arr = scr_dsmap_get_keys(keys);
    if (ds_map_find_value(keys, arr[item]) != value) {
        value = ds_map_find_value(keys, arr[item])
        _visibleKeyOnDropdown = _scr_text_shorten(string(arr[item]), fontBody, _bodyTextW);
        _changed = true;
        _modifyTarget = true;
    }
}

return value;
    

