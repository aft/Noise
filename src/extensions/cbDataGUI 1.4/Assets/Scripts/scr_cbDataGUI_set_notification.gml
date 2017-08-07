/// scr_cbDataGUI_set_notification(message_string, is_error?_boolean, [optional:visible_frame_count]);
/**
* @brief  Shows a tiny little notification on cbDataGUI panel. Use true as a 
*         second argument if it is an error message. Use false if it is just
*         an information message. You can optionally set its visibility time 
*         the third argument.
*
* @param  {string}    message_string        Message to show (Avoid long text)
* @param  {boolean}   is_error              True if it is an error, false if not
* @param  {number}   [visible_frame_count] Optional: How many frames it will be visible?
*         
* @return {Void} Returns nothing.
*
* @note   The message will be one line only. So avoid long messsages. It 
*         doesn't have any width check at the moment.
*/

// TODO: multi-line support

var c = instance_find(obj_cbDataGUI_controller, 0);

with (instance_create(0, 0, obj_cbDataGUI_notification)) {
    message = argument[0];
    error = argument[1];
    
    if (argument_count > 2) {
        alarm[0] = argument[2];
    } else {
        alarm[0] = clamp(room_speed / 30 * string_length(message), room_speed / 3 * 2, room_speed * 3);
    }
}

