/// scr_textbox_set_on_submit_cb(textbox_instance, script_asset, [arguments_as_array]);
/**
 * @brief  Sets a callback script to be run when the user presses the ENTER key in the textbox.
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 * @param  {script_asset} script_asset    Script name without the parenthesis (eg. scr_validate_email)
 * @param  {array} [arguments_as_array]   Optional: If your script requires arguments, put 
 *                                        them in an array first! (eg. [true, false, false] )
 *
 * @return {boolean} Returns undefined if instance can't be found or operation fails
 *                   Returns true otherwise
 *
 * @note You also have the option to set an on_change callback script for less expensive stuff.
 *
 * @see scr_textbox_unset_on_submit_cb
 * @see scr_textbox_set_on_change_cb
 * @see scr_textbox_unset_on_change_cb
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
        scr_textbox_unset_on_submit_cb(self);
        return undefined;
    }
    
    onSubmitCallbackScript = scr;
    if (argument_count > 2) {
        if (is_array(argument[2])) _oSargs = argument[2];
        else _oSargs = undefined; // to clean up
    }
    
    return true;    
}

