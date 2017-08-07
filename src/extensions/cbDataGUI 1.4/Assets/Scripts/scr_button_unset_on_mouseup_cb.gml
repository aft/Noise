///scr_button_unset_on_mouseup_cb(button_instance);
var o = argument[0];
if (!instance_exists(o)) {
    show_debug_message("Instance cannot be found. Check if you have a typo.");
    return undefined;
}

o.onMouseUpCallbackScript = undefined;
o._oMUpargs = undefined;
return true;    

