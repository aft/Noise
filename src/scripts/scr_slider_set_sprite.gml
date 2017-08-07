/// scr_slider_set_sprite(slider_instance, sprite_index, sprite_indicator, sprite_button);
/**
 * @brief  Sets the sprites for the slider. If you don't want to use a button, use
 *         -1 as a forth argument. You may also use scr_slider_show_button(obj, bool)
 *         to enable or disable it.
 * 
 * @param  {slider_instance} slider_instance  An instance of a slider
 * @param  {sprite_asset}    sprite_index     Sprite for the slider body
 * @param  {sprite_asset}    sprite_indicator Sprite for the slider indicator
 * @param  {sprite_asset}    sprite_button    Sprite for the slider button. 
 *                                            Use -1 to hide the button
 * 
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 *
 * @see scr_slider_show_button
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    var oldW = sprite_get_width(sprite_index) * image_xscale;
    var oldH = sprite_get_height(sprite_index) * image_yscale;
    
    sprite_index = argument1;
    image_xscale = oldW / sprite_get_width(argument1);
    image_yscale = oldH / sprite_get_height(argument1);
    
    if (argument2 == -1) sprite_indicator = undefined;
    else sprite_indicator = argument2;
    
    if (argument3 == -1) showButton = false;
    else sprite_button = argument3;
    
    _scr_slider_calcsizes();
    return true;
}
