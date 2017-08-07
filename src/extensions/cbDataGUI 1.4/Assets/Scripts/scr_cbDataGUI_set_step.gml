/// scr_cbDataGUI_set_step(target_obj, target_variable_str, step_size_number);
/**
* @brief  Sets an increment/decrement step value for a slider. You can
*         only set the step value for the variable that are number 
*         (meaning sliders) and, that doesn't have multiple choice 
*         (meaning dropdowns). These conditions are checked by this script.
*
* @param  {instance} target_obj          An object instance to be targeted
* @param  {string}   target_variable_str An instance variable name as a string. 
*                                        (Eg. If you want to change obj.radius, 
*                                        use "radius")
* @param  {number}   step_size_number    Increment/decrement amount
*         
* @return {instance} Returns step size. Returns undefined if fails.
*
* @see scr_cbDataGUI_set_range
*/

var i = 0;
var comp = noone;

repeat (instance_number(obj_cbDataGUI_component)) {
    var o = instance_find(obj_cbDataGUI_component, i);
    i++;
    if (o._type != cbData_type.folder && o._target == argument0 && o._targetVariable == argument1) {
        // component found
        comp = o;
    }
}

if (comp == noone) return undefined;
if (comp._type != cbData_type.number) return undefined;
if (comp._type != cbData_type.number && comp._multiple != undefined) {
    return undefined;    
} 

return scr_slider_set_step(comp._component[0], argument2);

