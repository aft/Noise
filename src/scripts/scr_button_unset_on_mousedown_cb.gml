///scr_button_unset_on_mousedown_cb(button_instance);
var o = argument[0];
if (!instance_exists(o)) {
    show_debug_message("Instance cannot be found. Check if you have a typo.");
    return undefined;
}

o.onMouseDownCallbackScript = undefined;
o._oMDownargs = undefined;
return true;    

