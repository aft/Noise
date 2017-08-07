///scr_colorpicker_unset_on_release_cb(colorpicker_instance);
var o = argument[0];
if (!instance_exists(o)) {
    show_debug_message("Instance cannot be found. Check if you have a typo.");
    return undefined;
}

o.onReleaseCallbackScript = undefined;
o._oRargs = undefined;
return true;    

