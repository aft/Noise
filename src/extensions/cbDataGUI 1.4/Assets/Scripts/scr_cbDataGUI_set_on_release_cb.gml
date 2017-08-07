/// scr_cbDataGUI_set_on_release_cb(target_object, target_variable, script_asset, [args_as_array]);
/**
* @brief  Sets a callback script to be run when there is the user releases the
*         mouse button/keypress etc. after a value change. This feature is only
*         available for SLIDERS and COLOR PICKERS at the moment.
*
* @param  {instance} target_obj           An object instance to be targeted
* @param  {string}   target_variable_str  An instance variable name as a string. 
*                                         (Eg. If you want to change obj.radius, 
*                                         use "radius")
* @param  {asset_script} script_asset     Script name without the parenthesis 
*                                         (eg. scr_validate_email)
* @param  {array}        [args_as_array]  Optional: Script arguments if necessary
*
* @return {boolean} Returns undefined if instance can't be found. 
*                   Returns false if script cannot be assigned. 
*                   Returns true if successful
*
* @see scr_cbDataGUI_unset_on_release_cb
*/

var o_count = instance_number(obj_cbDataGUI_component);
if (o_count <= 0) return undefined;

var ret = false;

for (var i = 0; i < o_count; i++) {
    var o = instance_find(obj_cbDataGUI_component, i);
    if (o._type != cbData_type.folder && o._type != cbData_type.function && o._target == argument[0] && o._targetVariable == argument[1]) {
        // component found
        with (o) {
            switch (_type) {
                case cbData_type.number:
                    // is dropdown?
                    if (is_undefined(_multiple)) {
                        if (argument_count > 3) scr_slider_set_on_release_cb(_component[@0], argument[2], argument[3]);
                        else scr_slider_set_on_release_cb(_component[@0], argument[2]);
                        ret = true;
                    }                        
                    break;
                case cbData_type.color:
                    // is dropdown?
                    if (is_undefined(_multiple)) {
                        if (argument_count > 3) scr_colorpicker_set_on_release_cb(_component, argument[2], argument[3]);
                        else scr_colorpicker_set_on_release_cb(_component, argument[2]);
                        ret = true;
                    }                        
                    break;
            }
        }
    }
}
return ret;

