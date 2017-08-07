/// scr_cbDataGUI_unset_on_release_cb(target_object, target_variable);
/**
* @brief  Unsets the callback script to be run when there is a value change 
*         on the responsible cbDataGUI row. 
*
* @param  {instance} target_obj           An object instance to be targeted
* @param  {string}   target_variable_str  An instance variable name as a string. 
*                                         (Eg. If you want to change obj.radius, 
*                                         use "radius")
*
* @return {boolean} Returns undefined if instance can't be found. 
*                   Returns false if responsible row cannot be found 
*                   Returns true if successful
*
* @see scr_cbDataGUI_set_on_release_cb
*/

var o_count = instance_number(obj_cbDataGUI_component);
if (o_count <= 0) return undefined;

for (var i = 0; i < o_count; i++) {
    var o = instance_find(obj_cbDataGUI_component, i);
    if (o._target == argument[0] && o._targetVariable == argument[1]) {
        // component found
        with (o) {
            switch (_type) {
                case cbData_type.number:
                    if (is_undefined(_multiple)) {
                        scr_slider_unset_on_release_cb(_component[@0]);
                    }                        
                    break;
                case cbData_type.color:
                    if (is_undefined(_multiple)) {
                        scr_colorpicker_unset_on_release_cb(_component);
                    }                        
                    break;
            }
            return true;
        }
    }
}
return false;

