/// scr_cbDataGUI_set_on_change_cb(target_object, target_variable, script_asset, [args_as_array]);
/**
* @brief  Sets a callback script to be run when there is a value change 
*         on the responsible cbDataGUI row.
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
* @note Avoid using resource intensive scripts as on_change_callback since user may 
*       change the value very rapidly. Use delayed alarms for expensive scripts
*       like spell checking, e-mail validation, etc. 
*
* @see scr_cbDataGUI_unset_on_change_cb
*/

var o_count = instance_number(obj_cbDataGUI_component);
if (o_count <= 0) return undefined;

for (var i = 0; i < o_count; i++) {
    var o = instance_find(obj_cbDataGUI_component, i);
    if (o._type != cbData_type.folder && o._type != cbData_type.function && o._target == argument[0] && o._targetVariable == argument[1]) {
        // component found
        with (o) {
            switch (_type) {
                case cbData_type.text:
                    // is dropdown?
                    if (!is_undefined(_multiple)) {
                        if (argument_count > 3) scr_dropdown_set_on_change_cb(_component, argument[2], argument[3]);
                        else scr_dropdown_set_on_change_cb(_component, argument[2]);
                    // or textbox                    
                    } else {
                        if (argument_count > 3) scr_textbox_set_on_change_cb(_component, argument[2], argument[3]);
                        else scr_textbox_set_on_change_cb(_component, argument[2]);
                    }                        
                    break;
                case cbData_type.number:
                    // is dropdown?
                    if (!is_undefined(_multiple)) {
                        if (argument_count > 3) scr_dropdown_set_on_change_cb(_component, argument[2], argument[3]);
                        else scr_dropdown_set_on_change_cb(_component, argument[2]);
                    // or slider                    
                    } else {
                        if (argument_count > 3) scr_slider_set_on_change_cb(_component[@0], argument[2], argument[3]);
                        else scr_slider_set_on_change_cb(_component[@0], argument[2]);
                    }                        
                    break;
                case cbData_type.boolean:
                    if (argument_count > 3) scr_checkbox_set_on_change_cb(_component, argument[2], argument[3]);
                    else scr_checkbox_set_on_change_cb(_component, argument[2]);
                    break;
                case cbData_type.color:
                    // is dropdown?
                    if (!is_undefined(_multiple)) {
                        if (argument_count > 3) scr_dropdown_set_on_change_cb(_component, argument[2], argument[3]);
                        else scr_dropdown_set_on_change_cb(_component, argument[2]);
                    // or colorpicker                    
                    } else {
                        if (argument_count > 3) scr_colorpicker_set_on_change_cb(_component, argument[2], argument[3]);
                        else scr_colorpicker_set_on_change_cb(_component, argument[2]);
                    }                        
                    break;
            }
            return true;
        }
    }
}
return false;

