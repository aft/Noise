/// scr_radio_set_instance_value(radio_instance, boolean);
/**
 * @brief  Sets the value of an radio insance. Setting a radio selected
 *         will unselect all other radios in the same group. If you want
 *         to set group value by name, use scr_radio_set_value instead.
 *
 * @param  {radio_instance} radio_instance    An instance of a radio
 * @param  {boolean} boolean                  Value to be set
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns the new value otherwise.
 *
 * @see scr_radio_set_value
 * @see scr_radio_get_value
 * @see scr_radio_get_instance_value
 */
 
var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (is_bool(argument1)) _scr_radio_setvalue(argument1);
    else return undefined;
}
return argument1;
