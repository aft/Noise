///_scr_cbDataGUI_togglegui();

_isOpen = !_isOpen;

// stay in view protection
if (!_isOpen) { if (y < view_yview[0]) y = 0; }
// protection ends

if (_usePresets && _presetObj != noone) {
    if (instance_exists(_presetObj)) {
        with (_presetObj) {
            for (var i = 0; i < array_length_1d(_objects); i++) {
            var o = _objects[@i];
                o.visible = other._isOpen;
                //if (other._isOpen) instance_activate_object(o)
                //else instance_deactivate_object(o);
            }
        }
    }
}

if (_component_array[@ 0] != undefined) {
    for (var j = 0; j < array_length_1d(_component_array); j++) {
        _scr_cbDataGUI_makevisible(_component_array[@j], _isOpen);    
    }
}

_scr_cbDataGUI_processrows();

return _isOpen;
