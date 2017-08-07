/// scr_cbDataGUI_set_value(target_object, target_variable, value);
/**
* @brief  Sets the value for the variable from cbDataGUI, not to the target
*         object.
*
* @param  {instance} target_obj          An object instance to be targeted
* @param  {string}   target_variable_str An instance variable name as a string. 
*                                        (Eg. If you want to change obj.radius, 
*                                        use "radius")
*         
* @return {any} Returns value. Returns undefined if fails.
*/

var comp = noone;
var v = undefined;
var val = argument2;

var o_count = instance_number(obj_cbDataGUI_component)
if (o_count <= 0) return undefined;

for (var i=0; i < o_count; i++) {
    var o = instance_find(obj_cbDataGUI_component, i);
    if (o._type != cbData_type.folder && o._target == argument0 && o._targetVariable == argument1) {
        // component found
        comp = o;
    }
}

if (comp == noone) return undefined;

switch (comp._type) {
    case cbData_type.text: 
        if (comp._multiple != undefined) {
            v = scr_dropdown_set_value(comp._component, val);
        } else {
            v = scr_textbox_set_value(comp._component, val);
        }
        break;
        
    case cbData_type.number:
        if (comp._multiple != undefined) {
            v = scr_dropdown_set_value(comp._component, val);
        } else {
            v = scr_slider_set_value(comp._component[0], val);
            scr_textbox_set_value(comp._component[1], val);
        }
        break;
        
    case cbData_type.boolean:
        v = scr_checkbox_set_value(comp._component, val);
        break;
        
    case cbData_type.color: 
        if (comp._multiple != undefined) {
            v = scr_dropdown_set_value(comp._component, val);
        } else {
            v = scr_colorpicker_set_value(comp._component, val);
        }
        break;
}

return v;
