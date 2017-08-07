///_scr_cbDataGUI_tooltip_add(target_object, target_variable, description_string);

var i = 0;
repeat (instance_number(obj_cbDataGUI_component)) {
    var o = instance_find(obj_cbDataGUI_component, i);
    i++;
    if (o._type != cbData_type.folder && o._target == argument0 && o._targetVariable == argument1) {
        // component found
        with (o) {
            if (_tooltip == noone) {
                // Using 'with' for 1.4 compatibility
                with (_tooltip) instance_destroy(); 
            }
            _tooltip = instance_create(x, y, obj_cbDataGUI_tooltip);
            _tooltip._object = _target;
            _tooltip._variable = _targetVariable;
            _tooltip._description = string(argument2);
            _tooltip._component = id;
            _tooltip.depth = _tooltip._component._c.depth - 9;
            _scr_cbDataGUI_calcmaxtextwidth();
            return true;
        }
    }
}

return undefined;

