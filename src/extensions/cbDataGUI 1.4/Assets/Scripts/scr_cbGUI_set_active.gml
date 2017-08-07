/// scr_cbGUI_set_active(cbGUI_instance);
/**
 * @brief  Sets the cbGUI object focused.
 *
 * @param  {cbGUI_instance} instance of a cbGUI object
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns the set value if successful
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
return _scr_cbGUI_setactive(o);
