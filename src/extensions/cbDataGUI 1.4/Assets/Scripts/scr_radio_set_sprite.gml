/// scr_radio_set_sprite(radio_instance, normal_sprite, pressed_sprite, tick_sprite);
/**
 * @brief  Sets the sprites for the radio. Use -1 for the sprites you don't 
 *         want to change.
 *
 * @param  {radio_instance} radio_instance  An instance of a radio
 * @param  {sprite_asset} normal_sprite     Sprite of the radio in normal state
 * @param  {sprite_asset} pressed_sprite    Sprite of the radio in pressed state
 * @param  {sprite_asset} tick_sprite       Sprite for selection indicator icon
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise
 */
 
var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (argument1 > -1) sprite_index = argument1;
    if (argument2 > -1) pressed_sprite_index = argument2;
    if (argument3 > -1) tick_sprite_index = argument3;
    return true;
}
