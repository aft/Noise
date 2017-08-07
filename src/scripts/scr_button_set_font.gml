/// scr_button_set_font(button_object, font);
/**
 * @brief  Sets the font to be used for the label of the button. Leave it
 *         unchanged if you want to use buttons without labels.
 *
 * @param  {button_instance} button_instance    An instance of a button
 * @param  {font_asset} font    Font resource
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    font = argument1;
    _scr_button_calcsizes();
    return true;
}
