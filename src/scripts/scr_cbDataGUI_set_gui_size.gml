/// scr_cbDataGUI_set_gui_size(float);
/**
* @brief  Changes the cbDataGUI size. To set the original size, use 1.
* @param  {float} size Values greater than 1.0 scales the GUI up,
*                      values between 0.0 and 1.0 scales the GUI down
* @return {Void} Nothing
*/
var gs = argument0;
global.cbGUI_guiSize = gs;

if (instance_number(obj_cbDataGUI_controller) > 0) {
    with (obj_cbDataGUI_controller) guiSize = gs;
}

scr_cbGUI_set_gui_size(gs);

