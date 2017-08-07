///scr_button_unset_on_mouseout_cb(button_instance);
var o = argument[0];
if (!instance_exists(o)) {
    show_debug_message("Instance cannot be found. Check if you have a typo.");
    return undefined;
}

o.onMouseOutCallbackScript = undefined;
o._oMOutargs = undefined;
return true;    

