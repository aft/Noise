// caller: controller

if (_presetObj == noone && _usePresets) {
    // create preset object and set _presetObj
    var obj = instance_create(x, y, obj_cbDataGUI_preset);
    obj._bodyW = _bodyW;
    _presetObj = obj;
    _presetH = obj._bodyH;

} else if (_presetObj != noone && !_usePresets) {
    // destroy object
    if (instance_exists(_presetObj)) {
        // destroy _p dsmap
        ds_map_destroy(_presetObj._p);
        
        // destroy dropdown and imagebuttons
        for (var i = 0; i < array_length_1d(_presetObj._objects); i++) {
            // Using 'with' for 1.4 compatibility
            with (_presetObj._objects[@i]) instance_destroy();
        }
        
        // destroy itself
        // Using 'with' for 1.4 compatibility
        with (_presetObj) instance_destroy();
        
        _presetObj = noone;
        _presetH = 0;
    }

} 

