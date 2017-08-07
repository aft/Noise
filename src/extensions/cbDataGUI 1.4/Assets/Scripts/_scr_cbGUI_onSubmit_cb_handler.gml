///_scr_cbGUI_onSubmit_cb_handler();

if (_submitted) {
    // call onSubmit callback
    if (onSubmitCallbackScript != undefined) {
    
        if (_oSargs == undefined) {
            if (script_exists(onSubmitCallbackScript)) {
                script_execute(onSubmitCallbackScript);
            } else {
                show_debug_message("`onSubmitCallback` script not found");
            }
        } else if (is_array(_oSargs)) {
            switch (array_length_1d(_oSargs)) {
               case 0:  script_execute(onSubmitCallbackScript); break;
               case 1:  script_execute(onSubmitCallbackScript, _oSargs[0]); break;
               case 2:  script_execute(onSubmitCallbackScript, _oSargs[0], _oSargs[1]); break;
               case 3:  script_execute(onSubmitCallbackScript, _oSargs[0], _oSargs[1], _oSargs[2]); break;
               case 4:  script_execute(onSubmitCallbackScript, _oSargs[0], _oSargs[1], _oSargs[2], _oSargs[3]); break;
               case 5:  script_execute(onSubmitCallbackScript, _oSargs[0], _oSargs[1], _oSargs[2], _oSargs[3], _oSargs[4]); break;
               case 6:  script_execute(onSubmitCallbackScript, _oSargs[0], _oSargs[1], _oSargs[2], _oSargs[3], _oSargs[4], _oSargs[5]); break;
               case 7:  script_execute(onSubmitCallbackScript, _oSargs[0], _oSargs[1], _oSargs[2], _oSargs[3], _oSargs[4], _oSargs[5], _oSargs[6]); break;
               case 8:  script_execute(onSubmitCallbackScript, _oSargs[0], _oSargs[1], _oSargs[2], _oSargs[3], _oSargs[4], _oSargs[5], _oSargs[6], _oSargs[7]); break;
               case 9:  script_execute(onSubmitCallbackScript, _oSargs[0], _oSargs[1], _oSargs[2], _oSargs[3], _oSargs[4], _oSargs[5], _oSargs[6], _oSargs[7], _oSargs[8]); break;
               case 10: script_execute(onSubmitCallbackScript, _oSargs[0], _oSargs[1], _oSargs[2], _oSargs[3], _oSargs[4], _oSargs[5], _oSargs[6], _oSargs[7], _oSargs[8], _oSargs[9]); break;
               case 11: script_execute(onSubmitCallbackScript, _oSargs[0], _oSargs[1], _oSargs[2], _oSargs[3], _oSargs[4], _oSargs[5], _oSargs[6], _oSargs[7], _oSargs[8], _oSargs[9], _oSargs[10]); break;
               case 12: script_execute(onSubmitCallbackScript, _oSargs[0], _oSargs[1], _oSargs[2], _oSargs[3], _oSargs[4], _oSargs[5], _oSargs[6], _oSargs[7], _oSargs[8], _oSargs[9], _oSargs[10], _oSargs[11]); break;
               case 13: script_execute(onSubmitCallbackScript, _oSargs[0], _oSargs[1], _oSargs[2], _oSargs[3], _oSargs[4], _oSargs[5], _oSargs[6], _oSargs[7], _oSargs[8], _oSargs[9], _oSargs[10], _oSargs[11], _oSargs[12]); break;
               case 14: script_execute(onSubmitCallbackScript, _oSargs[0], _oSargs[1], _oSargs[2], _oSargs[3], _oSargs[4], _oSargs[5], _oSargs[6], _oSargs[7], _oSargs[8], _oSargs[9], _oSargs[10], _oSargs[11], _oSargs[12], _oSargs[13]); break;
               case 15: script_execute(onSubmitCallbackScript, _oSargs[0], _oSargs[1], _oSargs[2], _oSargs[3], _oSargs[4], _oSargs[5], _oSargs[6], _oSargs[7], _oSargs[8], _oSargs[9], _oSargs[10], _oSargs[11], _oSargs[12], _oSargs[13], _oSargs[14]); break;
               default: show_debug_message("Too many arguments for `onSubmitCallback`");
           }
        }
    }
    _submitted = false;
}

