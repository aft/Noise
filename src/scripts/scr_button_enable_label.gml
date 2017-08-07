/// scr_button_enable_label(button_object, showLabel?);
/**
 * @brief  Sets the label as visible or invisible. By default, labels are
 *         enabled for all newly created buttons.
 *
 * @param  {button_instance} button_instance    An instance of a button
 * @param  {boolean} showLabel    Use true to show, false to hide
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    _useLabel = argument1;
    if (_useLabel) _scr_button_getvisiblelabel();
    else _scr_button_removelabel();
    return true;
}
