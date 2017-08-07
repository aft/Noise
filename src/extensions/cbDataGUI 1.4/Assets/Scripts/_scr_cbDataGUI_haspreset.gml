///_scr_cbDataGUI_haspreset(name_string);
// returns true or false

for (var i = 0; i < ds_list_size(_plist); i++) {
    if (ds_map_find_first(_plist[|i]) == argument0) return true;
}
return false;
