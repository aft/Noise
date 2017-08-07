/// Listen and remote control experimental features

// listen feature
if (_listen != noone && _listenVariable != undefined && _target == noone) {    
    if (instance_exists(_listen)) {
        var val = variable_instance_get(_listen.id, _listenVariable);
        switch (_type) {
            case 0:
                _scr_textbox_setvalue(val);
                break;
            case 1:
                _scr_slider_setvalue(val);
                break;
            case 2:
                _scr_checkbox_setvalue(val);
                break;
            case 7:
                _scr_colorpicker_setvalue(val);
                break;
        }
    } else {
        show_error("Listen instance cannot be found", true);
    }
}
// listen ends


// remote control
// so many precautions!!!
if (_modifyTarget) { // splitted into 2 ifs for performance reasons
    if (_listen == noone && _target != noone && _targetVariable != undefined) { // eliminate non-value objects like buttons   
        if (instance_exists(_target)) {
            // variable_instance_exists doesnt work on HTML. works on Win & Mac
            //if (variable_instance_exists(_target.id, _targetVariable)) { 
                with (_target) {
                    // what we are doing here is not recommended by YYG.
                    // variable_instance_* functions are for them to use. be aware.
                    variable_instance_set(id, other._targetVariable, other.value);
                }
            /*
            } else {
                show_error("Instance variable cannot be found. Check if you have typo. #
                            If you are using this on HTML platform, I strongly suggest #
                            using variable_instance_get to get the changed value by the#
                            GUI instead of using instance.variableName = x.", true);
            } */
        } else {
            show_debug_message("Target instance cannot be found.");
        }
    }
    _modifyTarget = false;
}
// remote control ends
