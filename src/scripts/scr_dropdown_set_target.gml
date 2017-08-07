/// scr_dropdown_set_target(dropdown_instance, target_object, target_variable);
/**
 * @brief  EXPERIMENTAL FEATURE! Allows you to target an object instance
 *         to change one of its instance variable value.
 *
 * @param  {dropdown_instance}       dropdown_instance  An instance of a dropdown
 * @param  {target_object}          target_object     Object instance to manipulate (eg. enemy)
 * @param  {target_object_variable} target_variable   Object instance variable to be manipulated (eg. enemy.health)
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true if successful
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    var ret = _scr_cbGUI_set_target(argument1, argument2);
    return ret;
}
