/// scr_button_set_sprite(button_object_instance, sprite_index);
/**
 * @brief  Sets a sprite for the button.
 *
 * @param  {button_instance} button_instance    An instance of a button
 * @param  {sprite_asset} sprite_index    Sprite resource
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    var oldW = sprite_get_width(sprite_index) * image_xscale;
    var oldH = sprite_get_height(sprite_index) * image_yscale;
    
    sprite_index = argument1;
    image_xscale = oldW / sprite_get_width(argument1);
    image_yscale = oldH / sprite_get_height(argument1);
    
    _scr_button_calcsizes();
    return true;
}


