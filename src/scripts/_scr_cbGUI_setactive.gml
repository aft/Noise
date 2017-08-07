//_scr_cbGUI_setactive();
var o = self;
if (argument_count > 0) o = argument[0];
with (obj_cbGUI_parent) _onFocus = false;
with (o) _onFocus = true;

global._cbGUI_component_controller._tabbed = o.id;
