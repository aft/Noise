//_scr_cbGUI_set_target(obj, var);

if (!instance_exists(argument0)) {
    show_debug_message("Target instance cannot be found.");
    _target = undefined;
    _targetVariable = undefined;
    return undefined;
}

if (!variable_instance_exists(argument0.id, string(argument1)) ) {
    show_debug_message("Instance variable cannot be found.");
    _target = undefined;
    _targetVariable = undefined;
    return undefined;
}

_target = argument0;
_targetVariable = argument1;
return true;

