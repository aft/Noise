///_scr_cbDataGUI_preset_dropdown_change();

var p = instance_find(obj_cbDataGUI_preset, 0);
if (!instance_exists(p)) {
    show_error("Instance cannot be found. Check if you have a typo.", true);
}

with (p) {
    var val = scr_dropdown_get_value(_dropdown);
    _scr_cbDataGUI_loadpreset(val);
}

