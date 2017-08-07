//_scr_cbDataGUI_getvalue(component);
// returns array -> [key, value]
// recursive

var comp = argument0;

if (!instance_exists(comp)) {
    show_error("Component not found.", true);
}

switch (comp._type) {
    case cbData_type.text: 
        var k, v;
        k = comp._targetVariable;
        if (comp._multiple != undefined) {
            v = scr_dropdown_get_value(comp._component);
        } else {
            v = scr_textbox_get_value(comp._component);
        }
        ds_map_add(_flat, k, v);
        break;
        
    case cbData_type.number:
        var k, v;
        k = comp._targetVariable;
        if (comp._multiple != undefined) {
            v = scr_dropdown_get_value(comp._component);
        } else {
            v = scr_slider_get_value(comp._component[0]);
        }
        ds_map_add(_flat, k, v);
        break;
        
    case cbData_type.boolean:
        var k, v;
        k = comp._targetVariable;
        v = scr_checkbox_get_value(comp._component);
        ds_map_add(_flat, k, v);
        break;
        
    case cbData_type.folder:
        var m = ds_map_create();
        for (var j = 0; j < array_length_1d(comp._folderItems); j++) {
            var item = comp._folderItems[@j];
            var k = item._targetVariable;
            var v = _scr_cbDataGUI_getvalue(comp._folderItems[@j]);
            if (item._type != cbData_type.folder && item._type != cbData_type.function) ds_map_add(_flat, k, v);
        }
        break;

    case cbData_type.color: 
        var k, v;
        k = comp._targetVariable;
        if (comp._multiple != undefined) {
            v = scr_dropdown_get_value(comp._component);
        } else {
            v = scr_colorpicker_get_value(comp._component);
        }
        ds_map_add(_flat, k, v);
        break;

}

return _flat;

