//_scr_cbDataGUI_preset_get_values_as_map();

var gui = instance_find(obj_cbDataGUI_controller, 0);
if (!instance_exists(gui)) {
    show_error("You need to run scr_cbDataGUI_create script first", true);
}

gui._flat = ds_map_create();

for (var i = 0; i < array_length_1d(gui._component_array); i++) {
    var o = gui._component_array[i];
    if (o._type != cbData_type.function) {
        with (gui) {
            _scr_cbDataGUI_getvalue(o);
        }
    }
}

var ret = ds_map_create();
ds_map_copy(ret, gui._flat);
ds_map_destroy(gui._flat);

return ret;


