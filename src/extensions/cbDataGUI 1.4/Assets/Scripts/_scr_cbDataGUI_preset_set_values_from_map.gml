//_scr_cbDataGUI_preset_set_values_from_map(dsmap);

var gui = instance_find(obj_cbDataGUI_controller, 0);
if (!instance_exists(gui)) {
    show_error("You need to run scr_cbDataGUI_create script first", true);
}

var dsmap = argument0;
if (!ds_exists(dsmap, ds_type_map)) exit;

for (var i = 0; i < array_length_1d(gui._component_array); i++) {
    var o = gui._component_array[i];
    if (o._type != cbData_type.function) {
        with (gui) {
            _scr_cbDataGUI_setvalue(o, dsmap);
        }
    }
}


