///_scr_cbGUI_onMouseOut_cb_handler();

// mouse out
if (onMouseOutCallbackScript != undefined) {

    if (_oMOutargs == undefined) {
        if (script_exists(onMouseOutCallbackScript)) {
            script_execute(onMouseOutCallbackScript);
        } else {
            show_debug_message("`onMouseOutCallback` script not found");
        }
    } else if (is_array(_oMOutargs)) {
        switch (array_length_1d(_oMOutargs)) {
           case 0:  script_execute(onMouseOutCallbackScript); break;
           case 1:  script_execute(onMouseOutCallbackScript, _oMOutargs[0]); break;
           case 2:  script_execute(onMouseOutCallbackScript, _oMOutargs[0], _oMOutargs[1]); break;
           case 3:  script_execute(onMouseOutCallbackScript, _oMOutargs[0], _oMOutargs[1], _oMOutargs[2]); break;
           case 4:  script_execute(onMouseOutCallbackScript, _oMOutargs[0], _oMOutargs[1], _oMOutargs[2], _oMOutargs[3]); break;
           case 5:  script_execute(onMouseOutCallbackScript, _oMOutargs[0], _oMOutargs[1], _oMOutargs[2], _oMOutargs[3], _oMOutargs[4]); break;
           case 6:  script_execute(onMouseOutCallbackScript, _oMOutargs[0], _oMOutargs[1], _oMOutargs[2], _oMOutargs[3], _oMOutargs[4], _oMOutargs[5]); break;
           case 7:  script_execute(onMouseOutCallbackScript, _oMOutargs[0], _oMOutargs[1], _oMOutargs[2], _oMOutargs[3], _oMOutargs[4], _oMOutargs[5], _oMOutargs[6]); break;
           case 8:  script_execute(onMouseOutCallbackScript, _oMOutargs[0], _oMOutargs[1], _oMOutargs[2], _oMOutargs[3], _oMOutargs[4], _oMOutargs[5], _oMOutargs[6], _oMOutargs[7]); break;
           case 9:  script_execute(onMouseOutCallbackScript, _oMOutargs[0], _oMOutargs[1], _oMOutargs[2], _oMOutargs[3], _oMOutargs[4], _oMOutargs[5], _oMOutargs[6], _oMOutargs[7], _oMOutargs[8]); break;
           case 10: script_execute(onMouseOutCallbackScript, _oMOutargs[0], _oMOutargs[1], _oMOutargs[2], _oMOutargs[3], _oMOutargs[4], _oMOutargs[5], _oMOutargs[6], _oMOutargs[7], _oMOutargs[8], _oMOutargs[9]); break;
           case 11: script_execute(onMouseOutCallbackScript, _oMOutargs[0], _oMOutargs[1], _oMOutargs[2], _oMOutargs[3], _oMOutargs[4], _oMOutargs[5], _oMOutargs[6], _oMOutargs[7], _oMOutargs[8], _oMOutargs[9], _oMOutargs[10]); break;
           case 12: script_execute(onMouseOutCallbackScript, _oMOutargs[0], _oMOutargs[1], _oMOutargs[2], _oMOutargs[3], _oMOutargs[4], _oMOutargs[5], _oMOutargs[6], _oMOutargs[7], _oMOutargs[8], _oMOutargs[9], _oMOutargs[10], _oMOutargs[11]); break;
           case 13: script_execute(onMouseOutCallbackScript, _oMOutargs[0], _oMOutargs[1], _oMOutargs[2], _oMOutargs[3], _oMOutargs[4], _oMOutargs[5], _oMOutargs[6], _oMOutargs[7], _oMOutargs[8], _oMOutargs[9], _oMOutargs[10], _oMOutargs[11], _oMOutargs[12]); break;
           case 14: script_execute(onMouseOutCallbackScript, _oMOutargs[0], _oMOutargs[1], _oMOutargs[2], _oMOutargs[3], _oMOutargs[4], _oMOutargs[5], _oMOutargs[6], _oMOutargs[7], _oMOutargs[8], _oMOutargs[9], _oMOutargs[10], _oMOutargs[11], _oMOutargs[12], _oMOutargs[13]); break;
           case 15: script_execute(onMouseOutCallbackScript, _oMOutargs[0], _oMOutargs[1], _oMOutargs[2], _oMOutargs[3], _oMOutargs[4], _oMOutargs[5], _oMOutargs[6], _oMOutargs[7], _oMOutargs[8], _oMOutargs[9], _oMOutargs[10], _oMOutargs[11], _oMOutargs[12], _oMOutargs[13], _oMOutargs[14]); break;
           default: show_debug_message("Too many arguments for `onReleaseCallback`");
       }
    }
}

