// reset row count

with (obj_cbDataGUI_controller) {

    _rowCount = 0;
    // reset _bodyH
    _bodyH = 0;
    if (_usePresets) {
        _bodyH += obj_cbDataGUI_preset._bodyH;
    }
    
    // count rows recursively
    var cCount = array_length_1d(_component_array);
    if (cCount > 0) {
        // process components
        for (var i = 0; i < cCount; i++) {
            _scr_cbDataGUI_getboxheight(_component_array[i], i);
        }
    }
    
    // adding the close button at the end
    _bodyH += _rowH;
    image_xscale = _bodyW;
    if (_isOpen) {
        image_yscale = _bodyH;
    } else {
        image_yscale = _rowH - 3;
    }

}


