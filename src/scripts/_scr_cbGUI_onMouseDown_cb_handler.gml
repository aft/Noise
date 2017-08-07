///_scr_cbGUI_onMouseDown_cb_handler();

// mouse down
if (onMouseDownCallbackScript != undefined) {

    if (_oMDownargs == undefined) {
        if (script_exists(onMouseDownCallbackScript)) {
            script_execute(onMouseDownCallbackScript);
        } else {
            show_debug_message("`onMouseDownCallback` script not found");
        }
    } else if (is_array(_oMDownargs)) {
        switch (array_length_1d(_oMDownargs)) {
           case 0:  script_execute(onMouseDownCallbackScript); break;
           case 1:  script_execute(onMouseDownCallbackScript, _oMDownargs[0]); break;
           case 2:  script_execute(onMouseDownCallbackScript, _oMDownargs[0], _oMDownargs[1]); break;
           case 3:  script_execute(onMouseDownCallbackScript, _oMDownargs[0], _oMDownargs[1], _oMDownargs[2]); break;
           case 4:  script_execute(onMouseDownCallbackScript, _oMDownargs[0], _oMDownargs[1], _oMDownargs[2], _oMDownargs[3]); break;
           case 5:  script_execute(onMouseDownCallbackScript, _oMDownargs[0], _oMDownargs[1], _oMDownargs[2], _oMDownargs[3], _oMDownargs[4]); break;
           case 6:  script_execute(onMouseDownCallbackScript, _oMDownargs[0], _oMDownargs[1], _oMDownargs[2], _oMDownargs[3], _oMDownargs[4], _oMDownargs[5]); break;
           case 7:  script_execute(onMouseDownCallbackScript, _oMDownargs[0], _oMDownargs[1], _oMDownargs[2], _oMDownargs[3], _oMDownargs[4], _oMDownargs[5], _oMDownargs[6]); break;
           case 8:  script_execute(onMouseDownCallbackScript, _oMDownargs[0], _oMDownargs[1], _oMDownargs[2], _oMDownargs[3], _oMDownargs[4], _oMDownargs[5], _oMDownargs[6], _oMDownargs[7]); break;
           case 9:  script_execute(onMouseDownCallbackScript, _oMDownargs[0], _oMDownargs[1], _oMDownargs[2], _oMDownargs[3], _oMDownargs[4], _oMDownargs[5], _oMDownargs[6], _oMDownargs[7], _oMDownargs[8]); break;
           case 10: script_execute(onMouseDownCallbackScript, _oMDownargs[0], _oMDownargs[1], _oMDownargs[2], _oMDownargs[3], _oMDownargs[4], _oMDownargs[5], _oMDownargs[6], _oMDownargs[7], _oMDownargs[8], _oMDownargs[9]); break;
           case 11: script_execute(onMouseDownCallbackScript, _oMDownargs[0], _oMDownargs[1], _oMDownargs[2], _oMDownargs[3], _oMDownargs[4], _oMDownargs[5], _oMDownargs[6], _oMDownargs[7], _oMDownargs[8], _oMDownargs[9], _oMDownargs[10]); break;
           case 12: script_execute(onMouseDownCallbackScript, _oMDownargs[0], _oMDownargs[1], _oMDownargs[2], _oMDownargs[3], _oMDownargs[4], _oMDownargs[5], _oMDownargs[6], _oMDownargs[7], _oMDownargs[8], _oMDownargs[9], _oMDownargs[10], _oMDownargs[11]); break;
           case 13: script_execute(onMouseDownCallbackScript, _oMDownargs[0], _oMDownargs[1], _oMDownargs[2], _oMDownargs[3], _oMDownargs[4], _oMDownargs[5], _oMDownargs[6], _oMDownargs[7], _oMDownargs[8], _oMDownargs[9], _oMDownargs[10], _oMDownargs[11], _oMDownargs[12]); break;
           case 14: script_execute(onMouseDownCallbackScript, _oMDownargs[0], _oMDownargs[1], _oMDownargs[2], _oMDownargs[3], _oMDownargs[4], _oMDownargs[5], _oMDownargs[6], _oMDownargs[7], _oMDownargs[8], _oMDownargs[9], _oMDownargs[10], _oMDownargs[11], _oMDownargs[12], _oMDownargs[13]); break;
           case 15: script_execute(onMouseDownCallbackScript, _oMDownargs[0], _oMDownargs[1], _oMDownargs[2], _oMDownargs[3], _oMDownargs[4], _oMDownargs[5], _oMDownargs[6], _oMDownargs[7], _oMDownargs[8], _oMDownargs[9], _oMDownargs[10], _oMDownargs[11], _oMDownargs[12], _oMDownargs[13], _oMDownargs[14]); break;
           default: show_debug_message("Too many arguments for `onReleaseCallback`");
       }
    }
}

