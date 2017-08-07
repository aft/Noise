///_scr_cbGUI_onMouseOver_cb_handler();

// mouse over
if (onMouseOverCallbackScript != undefined) {

    if (_oMOverargs == undefined) {
        if (script_exists(onMouseOverCallbackScript)) {
            script_execute(onMouseOverCallbackScript);
        } else {
            show_debug_message("`onMouseOverCallback` script not found");
        }
    } else if (is_array(_oMOverargs)) {
        switch (array_length_1d(_oMOverargs)) {
           case 0:  script_execute(onMouseOverCallbackScript); break;
           case 1:  script_execute(onMouseOverCallbackScript, _oMOverargs[0]); break;
           case 2:  script_execute(onMouseOverCallbackScript, _oMOverargs[0], _oMOverargs[1]); break;
           case 3:  script_execute(onMouseOverCallbackScript, _oMOverargs[0], _oMOverargs[1], _oMOverargs[2]); break;
           case 4:  script_execute(onMouseOverCallbackScript, _oMOverargs[0], _oMOverargs[1], _oMOverargs[2], _oMOverargs[3]); break;
           case 5:  script_execute(onMouseOverCallbackScript, _oMOverargs[0], _oMOverargs[1], _oMOverargs[2], _oMOverargs[3], _oMOverargs[4]); break;
           case 6:  script_execute(onMouseOverCallbackScript, _oMOverargs[0], _oMOverargs[1], _oMOverargs[2], _oMOverargs[3], _oMOverargs[4], _oMOverargs[5]); break;
           case 7:  script_execute(onMouseOverCallbackScript, _oMOverargs[0], _oMOverargs[1], _oMOverargs[2], _oMOverargs[3], _oMOverargs[4], _oMOverargs[5], _oMOverargs[6]); break;
           case 8:  script_execute(onMouseOverCallbackScript, _oMOverargs[0], _oMOverargs[1], _oMOverargs[2], _oMOverargs[3], _oMOverargs[4], _oMOverargs[5], _oMOverargs[6], _oMOverargs[7]); break;
           case 9:  script_execute(onMouseOverCallbackScript, _oMOverargs[0], _oMOverargs[1], _oMOverargs[2], _oMOverargs[3], _oMOverargs[4], _oMOverargs[5], _oMOverargs[6], _oMOverargs[7], _oMOverargs[8]); break;
           case 10: script_execute(onMouseOverCallbackScript, _oMOverargs[0], _oMOverargs[1], _oMOverargs[2], _oMOverargs[3], _oMOverargs[4], _oMOverargs[5], _oMOverargs[6], _oMOverargs[7], _oMOverargs[8], _oMOverargs[9]); break;
           case 11: script_execute(onMouseOverCallbackScript, _oMOverargs[0], _oMOverargs[1], _oMOverargs[2], _oMOverargs[3], _oMOverargs[4], _oMOverargs[5], _oMOverargs[6], _oMOverargs[7], _oMOverargs[8], _oMOverargs[9], _oMOverargs[10]); break;
           case 12: script_execute(onMouseOverCallbackScript, _oMOverargs[0], _oMOverargs[1], _oMOverargs[2], _oMOverargs[3], _oMOverargs[4], _oMOverargs[5], _oMOverargs[6], _oMOverargs[7], _oMOverargs[8], _oMOverargs[9], _oMOverargs[10], _oMOverargs[11]); break;
           case 13: script_execute(onMouseOverCallbackScript, _oMOverargs[0], _oMOverargs[1], _oMOverargs[2], _oMOverargs[3], _oMOverargs[4], _oMOverargs[5], _oMOverargs[6], _oMOverargs[7], _oMOverargs[8], _oMOverargs[9], _oMOverargs[10], _oMOverargs[11], _oMOverargs[12]); break;
           case 14: script_execute(onMouseOverCallbackScript, _oMOverargs[0], _oMOverargs[1], _oMOverargs[2], _oMOverargs[3], _oMOverargs[4], _oMOverargs[5], _oMOverargs[6], _oMOverargs[7], _oMOverargs[8], _oMOverargs[9], _oMOverargs[10], _oMOverargs[11], _oMOverargs[12], _oMOverargs[13]); break;
           case 15: script_execute(onMouseOverCallbackScript, _oMOverargs[0], _oMOverargs[1], _oMOverargs[2], _oMOverargs[3], _oMOverargs[4], _oMOverargs[5], _oMOverargs[6], _oMOverargs[7], _oMOverargs[8], _oMOverargs[9], _oMOverargs[10], _oMOverargs[11], _oMOverargs[12], _oMOverargs[13], _oMOverargs[14]); break;
           default: show_debug_message("Too many arguments for `onReleaseCallback`");
       }
    }
}

