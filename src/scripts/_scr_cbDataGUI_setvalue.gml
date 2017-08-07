//_scr_cbDataGUI_setvalue(component_instance, dsmap);
// recursive

var comp = argument0;
var dsmap = argument1; // { "liar": 1.000000, "abc": 10.000000 }


if (!instance_exists(comp)) {
    show_error("Component not found.", false);
    return false;
}

switch (comp._type) {
    case cbData_type.text: 
        var k, v;
        k = comp._targetVariable;
        v = ds_map_find_value(dsmap, k);
        //show_debug_message(k + " -> " + string(v));
        if (ds_map_exists(dsmap, k)) {
            //show_debug_message("Setting " + k + " as " + string(v));
            if (comp._multiple != undefined) {
                scr_dropdown_set_value(comp._component, v);
            } else {
                scr_textbox_set_value(comp._component, v);
                scr_cbGUI_mark_as_changed(comp._component);
            }
        }
        
        break;
        
    case cbData_type.number:
        var k, v;
        k = comp._targetVariable;
        v = ds_map_find_value(dsmap, k);
        //show_debug_message(k + " -> " + string(v));
        if (ds_map_exists(dsmap, k)) {
            //show_debug_message("Setting " + k + " as " + string(v));
            if (comp._multiple != undefined) {
                scr_dropdown_set_value(comp._component, v);
            } else {
                scr_slider_set_value(comp._component[@0], v);
                scr_cbGUI_mark_as_changed(comp._component[@0]);
                
                scr_textbox_set_value(comp._component[@1], v);
                scr_cbGUI_mark_as_changed(comp._component[@1]);
            }
        }
        break;
        
    case cbData_type.boolean:
        var k, v;
        k = comp._targetVariable;
        v = ds_map_find_value(dsmap, k);
        //show_debug_message(k + " -> " + string(v));
        if (ds_map_exists(dsmap, k)) {
            //show_debug_message("Setting " + k + " as " + string(v));
            scr_checkbox_set_value(comp._component, v);
            scr_cbGUI_mark_as_changed(comp._component);
        }
        break;
        
    case cbData_type.color:
        var k, v;
        k = comp._targetVariable;
        v = ds_map_find_value(dsmap, k);
        //show_debug_message(k + " -> " + string(v));
        if (ds_map_exists(dsmap, k)) {
            //show_debug_message("Setting " + k + " as " + string(v));
            if (comp._multiple != undefined) {
                scr_dropdown_set_value(comp._component, v);
            } else {
                scr_colorpicker_set_value(comp._component, v);
                scr_cbGUI_mark_as_changed(comp._component);
            }
        }
        break;

    case cbData_type.folder:
        for (var j = 0; j < array_length_1d(comp._folderItems); j++) {
            _scr_cbDataGUI_setvalue(comp._folderItems[@j], dsmap);
        }
        break;

}

return true;
