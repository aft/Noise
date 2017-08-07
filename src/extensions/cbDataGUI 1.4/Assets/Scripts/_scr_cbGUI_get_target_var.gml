//_scr_cbGUI_get_target_var(obj);
var o = argument0;
if (!instance_exists(o)) {
    show_debug_message("Instance cannot be found. Check if you have a typo.");
    return undefined;
}
return o._targetVariable;
