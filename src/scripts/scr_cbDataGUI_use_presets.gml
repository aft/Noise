/// scr_cbDataGUI_use_presets(bool);
/**
* @brief  <p>Enables or disables the Presets feature for the cbDataGUI panel.
*         Presets are the premade or user created sets that allow the user
*         to switch the row settings fast. If the necessary setting enabled,
*         presets are written to the disk as a file automatically. Auto
*         saving is disabled by default.</p>
*
*         <p>If presets are enabled, cbDataGUI checks the sandbox folder for
*         a previously created presets file and loads it automatically.</p>
*
*         <p>User also have the option to export and copy them to the clipboard.</p>
*
*         <p>cbDataGUI presets are stored in JSON string format.</p>
*
* @param  {boolean} bool    True to enable, false to disable presets.
*         
* @return {boolean} Returns newly set value. Returns undefined if fails.
*
* @see    scr_cbDataGUI_auto_save_presets
*/

var bool = argument0;

var c = instance_find(obj_cbDataGUI_controller, 0);
if (!instance_exists(c)) c = scr_cbDataGUI_create();

with (c) {
    _usePresets = bool;
    _scr_cbDataGUI_handlepresetobj(); // creates or deletes the presets object
    _scr_cbDataGUI_processrows();
    return bool;
}

