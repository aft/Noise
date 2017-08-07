/// scr_cbDataGUI_set_range(target_object, target_variable, min_value_number, max_value_number);
/**
* @brief  Sets the minimum and maximum value limits of a slider. Remember to
*         always set these values after creating a slider. Otherwise, the value
*         you set to the slider will be set as maximum limit. And minimum limit
*         will be set to 0 automatically.
*
* @param  {instance} target_obj          An object instance to be targeted
* @param  {string}   target_variable_str An instance variable name as a string. 
*                                        (Eg. If you want to change obj.radius, 
*                                        use "radius")
* @param  {number}   min_value_number    Minimum value
* @param  {number}   max_value_number    Maximum value
*         
* @return {boolean}  Returns true. Returns undefined if fails.
*
* @see scr_cbDataGUI_set_step
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

return scr_slider_set_range(comp._component[0], argument2, argument3);
