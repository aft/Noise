///_scr_cbDataGUI_import_json_string(string);

_p = json_decode(argument0);
var ret = false;

if (ds_exists(_p, ds_type_map)) {
    _plist = _p[? "presets"];
    _scr_cbDataGUI_updatedropdown();
    ret = true;
}

if (_p[? "preset"] != "") {
    _scr_cbDataGUI_loadpreset(_p[? "preset"]);
    scr_dropdown_set_value(_dropdown, _p[? "preset"]);
}

return ret;
