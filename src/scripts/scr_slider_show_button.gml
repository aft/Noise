/// scr_slider_show_button(slider_instance, boolean);
/**
 * @brief  Enables or disables the usage of the slider button. By
 *         default all sliders show button.
 * 
 * @param  {slider_instance} slider_instance  An instance of a slider
 * @param  {boolean}    boolean     Use false to hide the button.
 * 
 * @return {Void} Nothing.
 */

var o = argument0;
if (!instance_exists(o)) return undefined;
o.useButton = argument1;

