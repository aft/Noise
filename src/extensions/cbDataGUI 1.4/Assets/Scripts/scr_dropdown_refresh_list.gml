/// scr_dropdown_refresh_list(dropdown_instance);
/**
 * @brief  Refreshes the item list from the array or ds_map 
 *         you set it previously. You will only need to use this
 *         script if you are changing the names of the items
 *         dynamically (like adding asterix for unsaved data etc.
 *         If you ever use this something like that, let me know. I
 *         wanna be your friend.)
 *
 * @param  {dropdown_instance} dropdown_instance    An instance of a dropdown
 *
 * @return {Void} Nothing.
 */

var o = argument0;
if (!instance_exists(o)) exit;

with (o) {
    _scr_dropdown_updatekeys();
}


