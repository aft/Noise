/// scr_dropdown_set_sprite(dropdown_instance, body_sprite_3slices, icon_sprite, popup_body_sprite_9slices, seperator_sprite_3slices);
/**
 * @brief  Sets sprites for the dropdown box. Use -1 for the arguments
 *         you want to leave unmodified.
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 * @param  {sprite_index} body_sprite_3slices       3 slices sprite resource
 * @param  {sprite_index} icon_sprite               The right button sprite
 * @param  {sprite_index} popup_body_sprite_9slices 9 slices popup box sprite
 * @param  {sprite_index} seperator_sprite_3slices  3 slices sprite to be used between the popup items.
 *
 * @return {boolean} Returns undefined if instance can't be found. 
 *                   Returns true otherwise.
 */

var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    if (argument1 > -1) sprite_index = argument1;      // 3slices
    if (argument2 > -1) sprite_icon = argument2; 
    if (argument3 > -1) sprite_popup = argument3;      // 9slices
    if (argument4 > -1) sprite_seperator = argument4;  // 3slices
    _scr_dropdown_calcsizes();
    return true;
}

