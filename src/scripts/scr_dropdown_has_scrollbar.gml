/// scr_dropdown_has_scrollbar(dropdown_instance);
/**
 * @brief  Checks whether the dropdown box has a scroll bar or not.
 *
 * @param  {dropdown_instance} dropdown_instance An instance of a dropdown
 *
 * @return {boolean} Returns undefined if instance can't be found.
 *                   Returns true if yes.  
 *                   Returns false if no.
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
return o._scrollBar;
