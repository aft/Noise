/// scr_radio_get_name(radio_instance);
/**
 * @brief  Gets the name for a radio instance. Names are the way to 
 *         differenciate which slider is selected in the same group. 
 *
 * @param  {radio_instance} radio_instance    An instance of a radio
 *
 * @return {boolean} Returns undefined if instance can't be found or
 *                   no name is set. Returns the name otherwise
 *
 * @see scr_radio_set_name
 */
 
var o = argument0;
if (!instance_exists(o)) return undefined;
return o.name;
