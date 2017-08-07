///scr_cbGUI_track_depth_step(gui_mouse_x, gui_mouse_y);

var _nx = argument0;
var _ny = argument1;

// for depth tracking
// usage: if (scr_cbGUI_mouse(mouse_check_button_pressed(mb_left))) do_something();
if (position_meeting(_nx, _ny, self)) {
    if (ds_list_find_index(global._cbGUI_depth_tracker, id) == -1) {
        ds_list_add(global._cbGUI_depth_tracker, id);
    }
} else {
    if (ds_list_find_index(global._cbGUI_depth_tracker, id) != -1) {
        var i = ds_list_find_index(global._cbGUI_depth_tracker, id);
        ds_list_delete(global._cbGUI_depth_tracker, i);
    }
}
// depth tracking ends
