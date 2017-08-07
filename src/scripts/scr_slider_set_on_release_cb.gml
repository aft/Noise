/// scr_slider_set_on_release_cb(slider_instance, script_asset, [arguments_as_array]);
/**
 * @brief  Sets a callback script to be run when the user ends adjusting the slider by
 *         releasing the left mouse button.
 *
 * @param  {slider_instance} slider_instance An instance of a slider
 * @param  {script_asset} script_asset    Script name without the parenthesis (eg. scr_validate_email)
 * @param  {array} [arguments_as_array]   Optional: If your script requires arguments, put 
 *                                        them in an array first! (eg. [true, false, false] )
 *
 * @return {boolean} Returns undefined if instance can't be found or operation fails
 *                   Returns true if successful
 *
 * @see scr_slider_unset_on_change_cb
 * @see scr_slider_set_on_change_cb
 * @see scr_slider_unset_on_release_cb
 */

var o = argument[0];
var scr_in = argument[1];
var scr;

if (!instance_exists(o)) return undefined;

with (o) {
    if (is_string(scr_in)) {
        scr = asset_get_index(scr_in);
    } else if (script_exists(scr_in) || asset_get_type(scr_in) == asset_script) {
        scr = scr_in;
    } else {
        show_debug_message("You can only use script_name as string or script asset without the parentheses as an argument");
        scr_slider_unset_on_release_cb(self);
        return undefined;
    }
    
    onReleaseCallbackScript = scr;
    if (argument_count > 2) {
        if (is_array(argument[2])) _oRargs = argument[2];
        else _oRargs = undefined; // to clean up
    }
    
    return true;    
}

