///scr_colorpicker_set_on_release_cb(colorpicker_object, script_asset, [arguments_as_array]);

var o = argument[0];
var scr_in = argument[1];
var scr;

if (!instance_exists(o)) {
    show_debug_message("Instance cannot be found. Check if you have a typo.");
    return -1;
}

with (o) {
    if (is_string(scr_in)) {
        scr = asset_get_index(scr_in);
    } else if (script_exists(scr_in) || asset_get_type(scr_in) == asset_script) {
        scr = scr_in;
    } else {
        show_debug_message("You can only use script_name as string or script asset without the parentheses as an argument");
        scr_colorpicker_unset_on_release_cb(self);
        return undefined;
    }
    
    onReleaseCallbackScript = scr;
    if (argument_count > 2) {
        if (is_array(argument[2])) _oRargs = argument[2];
        else _oRargs = undefined; // to clean up
    }
    
    return true;    
}

