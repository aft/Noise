///onChange Callback handling

if (_changed) {
    
    // call onChange USER SET callback
    if (onChangeCallbackScript != undefined) {
        if (_oCargs == undefined) {
            if (script_exists(onChangeCallbackScript)) {
                script_execute(onChangeCallbackScript);
            } else {
                show_debug_message("`onChangeCallback` script not found");
            }
        } else if (is_array(_oCargs)) {
            switch (array_length_1d(_oCargs)) {
               case 0:  script_execute(onChangeCallbackScript); break;
               case 1:  script_execute(onChangeCallbackScript, _oCargs[0]); break;
               case 2:  script_execute(onChangeCallbackScript, _oCargs[0], _oCargs[1]); break;
               case 3:  script_execute(onChangeCallbackScript, _oCargs[0], _oCargs[1], _oCargs[2]); break;
               case 4:  script_execute(onChangeCallbackScript, _oCargs[0], _oCargs[1], _oCargs[2], _oCargs[3]); break;
               case 5:  script_execute(onChangeCallbackScript, _oCargs[0], _oCargs[1], _oCargs[2], _oCargs[3], _oCargs[4]); break;
               case 6:  script_execute(onChangeCallbackScript, _oCargs[0], _oCargs[1], _oCargs[2], _oCargs[3], _oCargs[4], _oCargs[5]); break;
               case 7:  script_execute(onChangeCallbackScript, _oCargs[0], _oCargs[1], _oCargs[2], _oCargs[3], _oCargs[4], _oCargs[5], _oCargs[6]); break;
               case 8:  script_execute(onChangeCallbackScript, _oCargs[0], _oCargs[1], _oCargs[2], _oCargs[3], _oCargs[4], _oCargs[5], _oCargs[6], _oCargs[7]); break;
               case 9:  script_execute(onChangeCallbackScript, _oCargs[0], _oCargs[1], _oCargs[2], _oCargs[3], _oCargs[4], _oCargs[5], _oCargs[6], _oCargs[7], _oCargs[8]); break;
               case 10: script_execute(onChangeCallbackScript, _oCargs[0], _oCargs[1], _oCargs[2], _oCargs[3], _oCargs[4], _oCargs[5], _oCargs[6], _oCargs[7], _oCargs[8], _oCargs[9]); break;
               case 11: script_execute(onChangeCallbackScript, _oCargs[0], _oCargs[1], _oCargs[2], _oCargs[3], _oCargs[4], _oCargs[5], _oCargs[6], _oCargs[7], _oCargs[8], _oCargs[9], _oCargs[10]); break;
               case 12: script_execute(onChangeCallbackScript, _oCargs[0], _oCargs[1], _oCargs[2], _oCargs[3], _oCargs[4], _oCargs[5], _oCargs[6], _oCargs[7], _oCargs[8], _oCargs[9], _oCargs[10], _oCargs[11]); break;
               case 13: script_execute(onChangeCallbackScript, _oCargs[0], _oCargs[1], _oCargs[2], _oCargs[3], _oCargs[4], _oCargs[5], _oCargs[6], _oCargs[7], _oCargs[8], _oCargs[9], _oCargs[10], _oCargs[11], _oCargs[12]); break;
               case 14: script_execute(onChangeCallbackScript, _oCargs[0], _oCargs[1], _oCargs[2], _oCargs[3], _oCargs[4], _oCargs[5], _oCargs[6], _oCargs[7], _oCargs[8], _oCargs[9], _oCargs[10], _oCargs[11], _oCargs[12], _oCargs[13]); break;
               case 15: script_execute(onChangeCallbackScript, _oCargs[0], _oCargs[1], _oCargs[2], _oCargs[3], _oCargs[4], _oCargs[5], _oCargs[6], _oCargs[7], _oCargs[8], _oCargs[9], _oCargs[10], _oCargs[11], _oCargs[12], _oCargs[13], _oCargs[14]); break;
               default: show_debug_message("Too many arguments for `onChangeCallback`");
           }
        }
    }

    // call onChange INTERNAL callback
    if (onChangeCallbackScript2 != undefined) {
        if (_oCargs2 == undefined) {
            if (script_exists(onChangeCallbackScript2)) {
                script_execute(onChangeCallbackScript2);
            } else {
                show_debug_message("`onChangeCallback2` script not found");
            }
        } else if (is_array(_oCargs2)) {
            switch (array_length_1d(_oCargs2)) {
               case 0:  script_execute(onChangeCallbackScript2); break;
               case 1:  script_execute(onChangeCallbackScript2, _oCargs2[0]); break;
               case 2:  script_execute(onChangeCallbackScript2, _oCargs2[0], _oCargs2[1]); break;
               case 3:  script_execute(onChangeCallbackScript2, _oCargs2[0], _oCargs2[1], _oCargs2[2]); break;
               case 4:  script_execute(onChangeCallbackScript2, _oCargs2[0], _oCargs2[1], _oCargs2[2], _oCargs2[3]); break;
               case 5:  script_execute(onChangeCallbackScript2, _oCargs2[0], _oCargs2[1], _oCargs2[2], _oCargs2[3], _oCargs2[4]); break;
               case 6:  script_execute(onChangeCallbackScript2, _oCargs2[0], _oCargs2[1], _oCargs2[2], _oCargs2[3], _oCargs2[4], _oCargs2[5]); break;
               case 7:  script_execute(onChangeCallbackScript2, _oCargs2[0], _oCargs2[1], _oCargs2[2], _oCargs2[3], _oCargs2[4], _oCargs2[5], _oCargs2[6]); break;
               case 8:  script_execute(onChangeCallbackScript2, _oCargs2[0], _oCargs2[1], _oCargs2[2], _oCargs2[3], _oCargs2[4], _oCargs2[5], _oCargs2[6], _oCargs2[7]); break;
               case 9:  script_execute(onChangeCallbackScript2, _oCargs2[0], _oCargs2[1], _oCargs2[2], _oCargs2[3], _oCargs2[4], _oCargs2[5], _oCargs2[6], _oCargs2[7], _oCargs2[8]); break;
               case 10: script_execute(onChangeCallbackScript2, _oCargs2[0], _oCargs2[1], _oCargs2[2], _oCargs2[3], _oCargs2[4], _oCargs2[5], _oCargs2[6], _oCargs2[7], _oCargs2[8], _oCargs2[9]); break;
               case 11: script_execute(onChangeCallbackScript2, _oCargs2[0], _oCargs2[1], _oCargs2[2], _oCargs2[3], _oCargs2[4], _oCargs2[5], _oCargs2[6], _oCargs2[7], _oCargs2[8], _oCargs2[9], _oCargs2[10]); break;
               case 12: script_execute(onChangeCallbackScript2, _oCargs2[0], _oCargs2[1], _oCargs2[2], _oCargs2[3], _oCargs2[4], _oCargs2[5], _oCargs2[6], _oCargs2[7], _oCargs2[8], _oCargs2[9], _oCargs2[10], _oCargs2[11]); break;
               case 13: script_execute(onChangeCallbackScript2, _oCargs2[0], _oCargs2[1], _oCargs2[2], _oCargs2[3], _oCargs2[4], _oCargs2[5], _oCargs2[6], _oCargs2[7], _oCargs2[8], _oCargs2[9], _oCargs2[10], _oCargs2[11], _oCargs2[12]); break;
               case 14: script_execute(onChangeCallbackScript2, _oCargs2[0], _oCargs2[1], _oCargs2[2], _oCargs2[3], _oCargs2[4], _oCargs2[5], _oCargs2[6], _oCargs2[7], _oCargs2[8], _oCargs2[9], _oCargs2[10], _oCargs2[11], _oCargs2[12], _oCargs2[13]); break;
               case 15: script_execute(onChangeCallbackScript2, _oCargs2[0], _oCargs2[1], _oCargs2[2], _oCargs2[3], _oCargs2[4], _oCargs2[5], _oCargs2[6], _oCargs2[7], _oCargs2[8], _oCargs2[9], _oCargs2[10], _oCargs2[11], _oCargs2[12], _oCargs2[13], _oCargs2[14]); break;
               default: show_debug_message("Too many arguments for `onChangeCallback2`");
           }
        }
    }    
    _changed = false;
}
