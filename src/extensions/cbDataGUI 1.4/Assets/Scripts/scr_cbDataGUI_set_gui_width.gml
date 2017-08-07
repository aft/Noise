/// scr_cbDataGUI_set_gui_width(number);
/**
* @brief  <p>Sets the width of the cbDataGUI. Minimum value is 245 
*         which is the default value. The x position of the
*         gui is reseted when you run this script. </p>
*
*         <p>It is best
*         to run it right after creating the cbDataGUI instance
*         and just before adding gui elements to cut down the 
*         calculations.</p>
*
* @param  {number} number  Width in pixels. Minimum value is 245.
*         
* @return {Void}    Nothing.
*/

var ww = max(245, argument0);

var gui = instance_find(obj_cbDataGUI_controller, 0);
if (!instance_exists(gui)) gui = scr_cbDataGUI_create();

with (gui) {
    _bodyW = ww;
    x = (display_get_gui_width()/guiSize - _bodyW);
    if (_presetObj != noone && _usePresets) {
        _presetObj._bodyW = ww;
    }
}

if (instance_number(obj_cbDataGUI_component) > 0) {
    // re-apply text shortening
    with (obj_cbDataGUI_component) _scr_cbDataGUI_calcmaxtextwidth();
}


