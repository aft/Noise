/// scr_cbDataGUI_has_row(target_object, target_variable);
/**
* @brief  Checks if there is a controller for the specified target object
*         and variable created.
*
* @param  {instance} target_obj          An object instance to be targeted
* @param  {string}   target_variable_str An instance variable name as a string. 
*                                        (Eg. If you want to change obj.radius, 
*                                        use "radius")
*         
* @return {Boolean} Returns true if found. Returns false if not found.
*/

var v = false;

var o_count = instance_number(obj_cbDataGUI_component)
if (o_count <= 0) return v;

for (var i=0; i < o_count; i++) {
    var o = instance_find(obj_cbDataGUI_component, i);
    if (o._type != cbData_type.folder && o._target == argument0 && o._targetVariable == argument1) {
        // component found
        v = true;
    }
}

return v;
