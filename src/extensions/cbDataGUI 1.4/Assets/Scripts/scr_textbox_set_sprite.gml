/// scr_textbox_set_sprite(textbox_instance, sprite_index);
/**
 * @brief  Sets the sprite of the textbox
 *
 * @param  {textbox_instance} textbox_instance An instance of a textbox
 * @param  {sprite_asset} sprite_index Name of the sprite resource
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
    
    _scr_textbox_calcsizes();
    return true;
}
