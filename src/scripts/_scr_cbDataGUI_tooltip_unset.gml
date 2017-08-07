///_scr_cbDataGUI_tooltip_unset(target_object, target_variable);

var i = 0;
repeat (instance_number(obj_cbDataGUI_component)) {
    var o = instance_find(obj_cbDataGUI_component, i);
    i++;
    if (o._type != cbData_type.folder && o._target == argument0 && o._targetVariable == argument1) {
        // component found
        with (o) {
            if (instance_exists(_tooltip)) {
                // Using 'with' for 1.4 compatibility
                with (_tooltip) instance_destroy();
            }
            _tooltip = noone;
            _scr_cbDataGUI_calcmaxtextwidth();
            return true;
        }
    }
}

return undefined;

