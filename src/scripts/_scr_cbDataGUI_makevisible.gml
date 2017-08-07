///_scr_cbDataGUI_makevisible(instance, boolean);

var o = argument0;
var bool = argument1;

if (object_get_name(o.object_index) == "obj_cbDataGUI_component") {
    // toggle tooltip visibility
    if (o._tooltip != noone) o._tooltip.visible = bool;
    // toggle cbGUI object visibility
    if (is_array(o._component)) {
        for (var k = 0; k < array_length_1d(o._component); k++) {
            // instance visibility
            o._component[@k].visible = bool;
            //if (bool) instance_activate_object(o._component[@k])
            //else instance_deactivate_object(o._component[@k]);
        }
    // toggle cbGUI object visibility
    } else {
        o._component.visible = bool;
        //if (bool) instance_activate_object(o._component)
        //else instance_deactivate_object(o._component);
    }
    // toggle visibility of itself
    o.visible = bool;
    
} else if (object_get_name(o.object_index) == "obj_cbDataGUI_folder") {
    // instance activation / deactivation
    if (o._isOpen) {
        // folder items
        for (var j = 0; j < array_length_1d(o._folderItems); j++) {
            //o.visible = bool;
            _scr_cbDataGUI_makevisible(o._folderItems[j], bool);
        }
    }
    
    // folder itself
    o.visible = bool;
    //if (bool) instance_activate_object(o)
    //else instance_deactivate_object(o);

}

