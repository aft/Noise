///_scr_cbGUI_onRelease_cb_handler();

// released
if (_onFocus && _released) {
    // mouse button released
    // call onRelease callback
    if (onReleaseCallbackScript != undefined) {
    
        if (_oRargs == undefined) {
            if (script_exists(onReleaseCallbackScript)) {
                script_execute(onReleaseCallbackScript);
            } else {
                show_debug_message("`onReleaseCallback` script not found");
            }
        } else if (is_array(_oRargs)) {
            switch (array_length_1d(_oRargs)) {
               case 0:  script_execute(onReleaseCallbackScript); break;
               case 1:  script_execute(onReleaseCallbackScript, _oRargs[0]); break;
               case 2:  script_execute(onReleaseCallbackScript, _oRargs[0], _oRargs[1]); break;
               case 3:  script_execute(onReleaseCallbackScript, _oRargs[0], _oRargs[1], _oRargs[2]); break;
               case 4:  script_execute(onReleaseCallbackScript, _oRargs[0], _oRargs[1], _oRargs[2], _oRargs[3]); break;
               case 5:  script_execute(onReleaseCallbackScript, _oRargs[0], _oRargs[1], _oRargs[2], _oRargs[3], _oRargs[4]); break;
               case 6:  script_execute(onReleaseCallbackScript, _oRargs[0], _oRargs[1], _oRargs[2], _oRargs[3], _oRargs[4], _oRargs[5]); break;
               case 7:  script_execute(onReleaseCallbackScript, _oRargs[0], _oRargs[1], _oRargs[2], _oRargs[3], _oRargs[4], _oRargs[5], _oRargs[6]); break;
               case 8:  script_execute(onReleaseCallbackScript, _oRargs[0], _oRargs[1], _oRargs[2], _oRargs[3], _oRargs[4], _oRargs[5], _oRargs[6], _oRargs[7]); break;
               case 9:  script_execute(onReleaseCallbackScript, _oRargs[0], _oRargs[1], _oRargs[2], _oRargs[3], _oRargs[4], _oRargs[5], _oRargs[6], _oRargs[7], _oRargs[8]); break;
               case 10: script_execute(onReleaseCallbackScript, _oRargs[0], _oRargs[1], _oRargs[2], _oRargs[3], _oRargs[4], _oRargs[5], _oRargs[6], _oRargs[7], _oRargs[8], _oRargs[9]); break;
               case 11: script_execute(onReleaseCallbackScript, _oRargs[0], _oRargs[1], _oRargs[2], _oRargs[3], _oRargs[4], _oRargs[5], _oRargs[6], _oRargs[7], _oRargs[8], _oRargs[9], _oRargs[10]); break;
               case 12: script_execute(onReleaseCallbackScript, _oRargs[0], _oRargs[1], _oRargs[2], _oRargs[3], _oRargs[4], _oRargs[5], _oRargs[6], _oRargs[7], _oRargs[8], _oRargs[9], _oRargs[10], _oRargs[11]); break;
               case 13: script_execute(onReleaseCallbackScript, _oRargs[0], _oRargs[1], _oRargs[2], _oRargs[3], _oRargs[4], _oRargs[5], _oRargs[6], _oRargs[7], _oRargs[8], _oRargs[9], _oRargs[10], _oRargs[11], _oRargs[12]); break;
               case 14: script_execute(onReleaseCallbackScript, _oRargs[0], _oRargs[1], _oRargs[2], _oRargs[3], _oRargs[4], _oRargs[5], _oRargs[6], _oRargs[7], _oRargs[8], _oRargs[9], _oRargs[10], _oRargs[11], _oRargs[12], _oRargs[13]); break;
               case 15: script_execute(onReleaseCallbackScript, _oRargs[0], _oRargs[1], _oRargs[2], _oRargs[3], _oRargs[4], _oRargs[5], _oRargs[6], _oRargs[7], _oRargs[8], _oRargs[9], _oRargs[10], _oRargs[11], _oRargs[12], _oRargs[13], _oRargs[14]); break;
               default: show_debug_message("Too many arguments for `onReleaseCallback`");
           }
        }
    }
    _released = false;
}
