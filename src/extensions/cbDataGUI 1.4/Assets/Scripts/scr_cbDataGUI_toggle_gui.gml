/// scr_cbDataGUI_toggle_gui();
/**
* @brief  Minimizes or restores the cbDataGUI panel everytime it is called.
* @return {boolean} Returns visibility as boolean. Returns undefined if fails.
*/

var c = instance_find(obj_cbDataGUI_controller, 0);
if (!instance_exists(c)) return undefined;

with (c) return _scr_cbDataGUI_togglegui();


