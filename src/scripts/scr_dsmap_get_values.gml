/// scr_dsmap_get_values(ds_map);
/**
* @brief  Gets the values of a ds_map as an array.
* @param  {ds_map} ds_map ds_map
* @return {array}  Returns array if successful, undefined if fails.
*/

if (!ds_exists(argument0, ds_type_map)) return undefined;

var m = argument0;
var size = ds_map_size(m);
var arr;
var first = ds_map_find_first(m);
if (!is_undefined(first)) arr[0] = ds_map_find_value(m, first);

for (var i=0; i<size; i++) {
    first = ds_map_find_next(m, first);
    if (is_undefined(first)) break;
    arr[i+1] = ds_map_find_value(m, first);
}

return arr;
