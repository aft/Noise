//_scr_cbDataGUI_getboxheight(component_or_folder_instance, rowNo_int);

var o = argument0;
var r = argument1; // unused? TODO

if (object_get_name(o.object_index) == "obj_cbDataGUI_component") {
    _rowCount++;
    o._row = _rowCount - 1; //rowCount starts with 1. we want it to start with 0.
    o._c._bodyH += o._c._rowH;
    
} else if (object_get_name(o.object_index) == "obj_cbDataGUI_folder") {
    // folder itself
    _rowCount++;
    o._row = _rowCount - 1;
    o._c._bodyH += o._c._rowH;
    
    if (o._isOpen) {
        // folder items
        for (var j = 0; j < array_length_1d(o._folderItems); j++) {
            o._folderItems[@j]._indent = o._indent + 1;
            o._folderItems[@j]._row = _rowCount;
            _scr_cbDataGUI_getboxheight(o._folderItems[j], _rowCount);
        }
    }
}

