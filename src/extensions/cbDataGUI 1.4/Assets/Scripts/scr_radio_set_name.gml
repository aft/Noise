/// scr_radio_set_name(radio_instance, name_str);
/**
 * @brief  Sets the name for a radio instance. Names of the radio boxes MUST
 *         have unique strings. Names are the way to differenciate which
 *         slider is selected in the same group. 
 *
 * @param  {radio_instance} radio_instance    An instance of a radio
 * @param  {string}         name_str          Name of the radio instance
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns the newly set name otherwise
 *
 * @note There is no code to check if the name is unique among the group
 *       members currently. So be careful. If there are multiple radios
 *       with the same name, the user that clicks on will be selected.
 *       scr_radio_set_value will select the first instance with the lower
 *       id only. Everything else should still work properly.
 *
 * @see scr_radio_get_name
 */
 
var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    name = string(argument1);
    return name;
}

