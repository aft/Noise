///scr_cbGUI_mouse(boolean);
// for depth tracking
{
    if (argument[0]) {
        var mdo; // min depth obj
        mdo = ds_list_find_value(global._cbGUI_depth_tracker, 0);
    
        for (var i = 0; i < ds_list_size(global._cbGUI_depth_tracker); i++) {
            var o = ds_list_find_value(global._cbGUI_depth_tracker, i);
            if (mdo.depth > o.depth) mdo = o.id;
        }
        
        if (mdo == id) return true; // me = on top
        return false;
    }
}
