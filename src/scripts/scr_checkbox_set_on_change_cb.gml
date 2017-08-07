/// scr_checkbox_set_on_change_cb(checkbox_instance, script_asset, [arguments_as_array]);
/**
* @brief  Sets a callback script to be run when there is a value change in the checkbox.
*
* @param  {checkbox_instance} checkbox_instance An instance of a slider
* @param  {script_asset} script_asset    Script name without the parenthesis (eg. scr_validate_email)
* @param  {array} [arguments_as_array]   Optional: If your script requires arguments, put 
*                                        them in an array first! (eg. [true, false, false] )
*
* @return {boolean} Returns undefined if instance can't be found or operation fails
*                   Returns true if successful
*
* @note Avoid using resource intensive scripts as on_change_callback since user may 
*       change the value very rapidly. Use delayed alarms for expensive scripts
*       like spell checking, e-mail validation, etc. 
*
* @see scr_checkbox_unset_on_change_cb
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
        scr_checkbox_unset_on_change_cb(self);
        return undefined;
    }
    
    onChangeCallbackScript = scr;
    if (argument_count > 2) {
        if (is_array(argument[2])) _oCargs = argument[2];
        else _oCargs = undefined; // to clean up
    }
    
    return true;    
}

