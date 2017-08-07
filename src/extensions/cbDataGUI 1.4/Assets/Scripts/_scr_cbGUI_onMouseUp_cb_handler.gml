///_scr_cbGUI_onMouseUp_cb_handler();

// mouse up
if (onMouseUpCallbackScript != undefined) {

    if (_oMUpargs == undefined) {
        if (script_exists(onMouseUpCallbackScript)) {
            script_execute(onMouseUpCallbackScript);
        } else {
            show_debug_message("`onMouseUpCallback` script not found");
        }
    } else if (is_array(_oMUpargs)) {
        switch (array_length_1d(_oMUpargs)) {
           case 0:  script_execute(onMouseUpCallbackScript); break;
           case 1:  script_execute(onMouseUpCallbackScript, _oMUpargs[0]); break;
           case 2:  script_execute(onMouseUpCallbackScript, _oMUpargs[0], _oMUpargs[1]); break;
           case 3:  script_execute(onMouseUpCallbackScript, _oMUpargs[0], _oMUpargs[1], _oMUpargs[2]); break;
           case 4:  script_execute(onMouseUpCallbackScript, _oMUpargs[0], _oMUpargs[1], _oMUpargs[2], _oMUpargs[3]); break;
           case 5:  script_execute(onMouseUpCallbackScript, _oMUpargs[0], _oMUpargs[1], _oMUpargs[2], _oMUpargs[3], _oMUpargs[4]); break;
           case 6:  script_execute(onMouseUpCallbackScript, _oMUpargs[0], _oMUpargs[1], _oMUpargs[2], _oMUpargs[3], _oMUpargs[4], _oMUpargs[5]); break;
           case 7:  script_execute(onMouseUpCallbackScript, _oMUpargs[0], _oMUpargs[1], _oMUpargs[2], _oMUpargs[3], _oMUpargs[4], _oMUpargs[5], _oMUpargs[6]); break;
           case 8:  script_execute(onMouseUpCallbackScript, _oMUpargs[0], _oMUpargs[1], _oMUpargs[2], _oMUpargs[3], _oMUpargs[4], _oMUpargs[5], _oMUpargs[6], _oMUpargs[7]); break;
           case 9:  script_execute(onMouseUpCallbackScript, _oMUpargs[0], _oMUpargs[1], _oMUpargs[2], _oMUpargs[3], _oMUpargs[4], _oMUpargs[5], _oMUpargs[6], _oMUpargs[7], _oMUpargs[8]); break;
           case 10: script_execute(onMouseUpCallbackScript, _oMUpargs[0], _oMUpargs[1], _oMUpargs[2], _oMUpargs[3], _oMUpargs[4], _oMUpargs[5], _oMUpargs[6], _oMUpargs[7], _oMUpargs[8], _oMUpargs[9]); break;
           case 11: script_execute(onMouseUpCallbackScript, _oMUpargs[0], _oMUpargs[1], _oMUpargs[2], _oMUpargs[3], _oMUpargs[4], _oMUpargs[5], _oMUpargs[6], _oMUpargs[7], _oMUpargs[8], _oMUpargs[9], _oMUpargs[10]); break;
           case 12: script_execute(onMouseUpCallbackScript, _oMUpargs[0], _oMUpargs[1], _oMUpargs[2], _oMUpargs[3], _oMUpargs[4], _oMUpargs[5], _oMUpargs[6], _oMUpargs[7], _oMUpargs[8], _oMUpargs[9], _oMUpargs[10], _oMUpargs[11]); break;
           case 13: script_execute(onMouseUpCallbackScript, _oMUpargs[0], _oMUpargs[1], _oMUpargs[2], _oMUpargs[3], _oMUpargs[4], _oMUpargs[5], _oMUpargs[6], _oMUpargs[7], _oMUpargs[8], _oMUpargs[9], _oMUpargs[10], _oMUpargs[11], _oMUpargs[12]); break;
           case 14: script_execute(onMouseUpCallbackScript, _oMUpargs[0], _oMUpargs[1], _oMUpargs[2], _oMUpargs[3], _oMUpargs[4], _oMUpargs[5], _oMUpargs[6], _oMUpargs[7], _oMUpargs[8], _oMUpargs[9], _oMUpargs[10], _oMUpargs[11], _oMUpargs[12], _oMUpargs[13]); break;
           case 15: script_execute(onMouseUpCallbackScript, _oMUpargs[0], _oMUpargs[1], _oMUpargs[2], _oMUpargs[3], _oMUpargs[4], _oMUpargs[5], _oMUpargs[6], _oMUpargs[7], _oMUpargs[8], _oMUpargs[9], _oMUpargs[10], _oMUpargs[11], _oMUpargs[12], _oMUpargs[13], _oMUpargs[14]); break;
           default: show_debug_message("Too many arguments for `onReleaseCallback`");
       }
    }
}

