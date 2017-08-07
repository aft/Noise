/// scr_textbox_set_selection(textbox_instance, start_no, end_no);
/**
 * @brief  Selects part of a text of the textbox.
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 * @param  {number} start_no Number of the first character of the selection
 * @param  {number} end_no   Number of the character that selection ends with
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns false if unsuccessful
 *                   Returns true if successful
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    var start = floor(clamp(min(argument1, argument2), 0, _txtLen));
    var stop  = floor(clamp(max(argument1, argument2), 0, _txtLen));
    
    // make selection if numbers are different
    if (argument1 != argument2) {
        _selection[@0] = start;
        _selection[@1] = stop;
        _selected = true;
        _scr_textbox_setcursorpos(stop);
        _scr_textbox_setblink();
        return true;
    }
    _scr_textbox_unselect();
    return false;
}
