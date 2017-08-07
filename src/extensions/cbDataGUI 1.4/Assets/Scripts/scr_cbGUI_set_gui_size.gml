/// scr_cbGUI_set_gui_size(float);
/**
* @brief  Changes the cbGUI size. To set the original size, use 1.
* @param  {float} size Values greater than 1.0 scales the GUI up,
*                      values between 0.0 and 1.0 scales the GUI down
* @return {Void} Nothing
*/
var gs = argument0;
global.cbGUI_guiSize = gs;

if (instance_find(obj_cbGUI_parent, 0) > 0) {
    with (obj_cbGUI_parent) guiSize = gs;
}

var appPos = application_get_position();
display_set_gui_size((appPos[2]-appPos[0])/gs, (appPos[3]-appPos[1])/gs);
