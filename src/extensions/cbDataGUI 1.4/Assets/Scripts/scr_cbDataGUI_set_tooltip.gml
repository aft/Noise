/// scr_cbDataGUI_set_tooltip(target_object, target_variable, description_string);
/**
* @brief  Sets a description text to the cbDataGUI row. You don't have to set
*         tooltips for every row. It's an optional feature in case you need it.
*         Use scr_cbDataGUI_unset_tooltip if you wan't to remove a tooltip you
*         previously set.
*
* @param  {instance} target_obj          An object instance to be targeted
* @param  {string}   target_variable_str An instance variable name as a string. 
*                                        (Eg. If you want to change obj.radius, 
*                                        use "radius")
* @param  {string}   description_string  Description text. Can have any chars.
*         
* @return {instance} Returns true if successful. Returns undefined if fails.
*
* @see scr_cbDataGUI_unset_tooltip
*/

return _scr_cbDataGUI_tooltip_set(argument0, argument1, argument2);

