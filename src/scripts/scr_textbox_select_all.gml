/// scr_textbox_select_all(textbox_instance);
/**
 * @brief  Selects all the text of the textbox
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Return false if unsuccessful
 *                   Returns true if successful
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    // make selection if numbers are different
    if (_txtLen > 0) {
        _selection[@0] = 0;
        _selection[@1] = _txtLen;
        _scr_textbox_setcursorpos(_txtLen);
        _scr_textbox_setblink();
        return true;
    }
    return false;
}
