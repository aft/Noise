/// scr_checkbox_set_sprite(checkbox_instance, normal_sprite, pressed_sprite, tick_sprite);
/**
 * @brief  Sets the sprite of the checkbox
 *
 * @param  {checkbox_instance} checkbox_instance    An instance of a checkbox
 * @param  {sprite_asset} normal_sprite   Sprite of the checkbox in normal state
 * @param  {sprite_asset} pressed_sprite  Sprite of the checkbox in focused state
 * @param  {sprite_asset} tick_sprite     Sprite of the checkbox indicator icon (The tick sign)
 *
 * @return {boolean} Returns undefined if instance can't be found
 *                   Returns true otherwise
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (argument1 != -1) sprite_index = argument1;
    if (argument2 != -1) pressed_sprite_index = argument2;
    if (argument3 != -1) tick_sprite_index = argument3;
    return true;
}
