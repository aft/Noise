/// scr_cbGUI_mark_as_changed(cbGUI_instance);
/**
 * @brief  Marks the cbGUI object as "changed' manually so that 'on change'
 *         callback scripts are run.
 *
 * @param  {cbGUI_instance} instance of a cbGUI object
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true if successful
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _changed = true;
    return true;
}
