/// scr_cbDataGUI_auto_save_presets(bool);
/**
* @brief  <p>Enables or disables auto-saving of the presets file to the disk.
*         Auto-saving is disabled by default.</p>
*
*         <p>If presets are enabled, cbDataGUI checks the sandbox folder for
*         a previously created presets file and loads it automatically.</p>
*
*         <p>cbDataGUI presets are stored in JSON string format.</p>
*
* @param  {boolean} bool    True to enable, false to disable auto-saving.
*         
* @return {boolean} Returns newly set value. Returns undefined if fails.
*
* @see    scr_cbDataGUI_use_presets
*/

var bool = argument0;

var p = instance_find(obj_cbDataGUI_preset, 0);
if (!instance_exists(p)) return undefined;

with (p) {
    _saveToFile = bool;
    return bool;
}




