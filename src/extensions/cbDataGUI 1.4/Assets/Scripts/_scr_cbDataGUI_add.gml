///_scr_cbDataGUI_add(x, y, cbData_type, target, varname, optional:multiple);
// called by scr_cbDataGUI_add()

var gObj;
var gObj2;
var component;
var xx = argument[0];
var yy = argument[1];

var gui = instance_find(obj_cbDataGUI_controller, 0);
if (!instance_exists(gui)) gui = scr_cbDataGUI_create();

component           = instance_create(xx, yy, obj_cbDataGUI_component);
component._type     = argument[2];
component._target   = argument[3];
component._targetVariable = argument[4];


with (component) {
    _scr_cbDataGUI_calcmaxtextwidth();
}


var val = undefined;
if (argument[3] != noone) {
    if (instance_exists(argument[3]) && argument[4] != undefined) {
        val = variable_instance_get(argument[3].id, string(argument[4]));
    }    
}

switch (argument[2]) {
    case cbData_type.text:
        /// DROPDOWN
        if (argument_count > 5) {
            var mult = argument[5];
            component._multiple = mult;
            
            gObj = instance_create(xx, yy, obj_cbGUI_dropdown);
            gObj.depth = gui.depth - 11;
            scr_dropdown_set_sprite(gObj, 
                spr_cbDataGUI_dropdown,
                spr_cbDataGUI_dropdown_ico, -1, -1
            );
            scr_dropdown_set_popup_offset(gObj, 0);
            scr_dropdown_set_padding(gObj, 5, 10);
            scr_dropdown_set_sizes(gObj, 142, 19);
            scr_dropdown_set_font(gObj, gui.font, gui.font);
            
            scr_dropdown_set_target(gObj, argument[3], argument[4]);
            
            scr_dropdown_set_list(gObj, mult);
            scr_dropdown_set_value(gObj, val);
            
        /// TEXTBOX    
        } else  {
            gObj = instance_create(xx, yy, obj_cbGUI_textbox);
            gObj.depth = gui.depth - 2;
            scr_textbox_set_sprite(gObj, spr_cbDataGUI_textbox);
            scr_textbox_set_sizes(gObj, 142, 19);
            scr_textbox_set_padding(gObj, 2);
            scr_textbox_set_indent(gObj, 2);
            scr_textbox_set_font(gObj, gui.font);
            scr_textbox_set_color(gObj,
                global._cbColors[_cbDataGUIColor.text],
                make_color_rgb(80, 80, 80),
                make_color_rgb(151, 203, 255),
                make_color_rgb(0, 0, 0),
                make_color_rgb(30, 30, 30)
            );
            scr_textbox_set_target(gObj, argument[3], argument[4]);
            
            // set_value
            scr_textbox_set_value(gObj, val);
        }
        component._component = gObj;
        break;
        
    case cbData_type.number:
        /// DROPDOWN
        if (argument_count > 5) {
            var mult = argument[5];
            component._multiple = mult;
            
            gObj = instance_create(xx, yy, obj_cbGUI_dropdown);
            gObj.depth = gui.depth - 11;
            scr_dropdown_set_sprite(gObj, 
                spr_cbDataGUI_dropdown,
                spr_cbDataGUI_dropdown_ico, -1, -1
            );
            scr_dropdown_set_popup_offset(gObj, 0);
            scr_dropdown_set_padding(gObj, 5, 10);
            scr_dropdown_set_sizes(gObj, 142, 19);
            scr_dropdown_set_font(gObj, gui.font, gui.font);
                        
            scr_dropdown_set_target(gObj, argument[3], argument[4]);
            
            scr_dropdown_set_list(gObj, mult);
            scr_dropdown_set_value(gObj, val);
            component._component = gObj;

            
        /// SLIDER
        } else  {
            gObj = instance_create(xx, yy, obj_cbGUI_slider);
            gObj.depth = gui.depth - 2;
            scr_slider_set_sizes(gObj, 92, 19);
            scr_slider_set_sprite(gObj, spr_cbDataGUI_slider, -1, -1);
            scr_slider_set_color(gObj, make_color_rgb(151, 203, 255),
                        global._cbColors[_cbDataGUIColor.number],
                        make_color_rgb(80, 80, 80)
            );
            scr_slider_set_padding(gObj, 0, 0);
            
            gObj2 = instance_create(xx, yy, obj_cbGUI_textbox);
            gObj2.depth = gui.depth - 2;
            scr_textbox_set_sprite(gObj2, spr_cbDataGUI_textbox_small);
            scr_textbox_set_sizes(gObj2, 44, 19);
            scr_textbox_set_padding(gObj2, 2);
            scr_textbox_set_indent(gObj2, 2);
            scr_textbox_set_font(gObj2, gui.font);
            scr_textbox_set_color(gObj2,
                make_color_rgb(151, 203, 255),
                make_color_rgb(80, 80, 80),
                make_color_rgb(151, 203, 255),
                make_color_rgb(0, 0, 0),
                make_color_rgb(30, 30, 30)
            );
            
            // set_value
            scr_slider_set_value(gObj, val);
            scr_textbox_set_value(gObj2, val);
            
            scr_slider_set_target(gObj, argument[3], argument[4]);
            
            // setting up onChange callbacks
            gObj.onChangeCallbackScript2 = _scr_slider_on_change;
            var arr;
            arr[0] = gObj2;
            gObj._oCargs2 = arr;
            
            var arr2;
            arr2[0] = gObj;
            gObj2.onChangeCallbackScript = _scr_textbox_update_slider;
            gObj2._oCargs = arr2; 
            // callback setup end
            
            component._component[0] = gObj;
            component._component[1] = gObj2;
        }
        break;
        
    case cbData_type.boolean:
        gObj = instance_create(xx, yy, obj_cbGUI_checkbox);
        gObj.depth = gui.depth - 2;
        scr_checkbox_set_sprite(gObj, spr_cbDataGUI_checkbox, 
                                      spr_cbDataGUI_checkbox_pressed, 
                                      spr_cbDataGUI_checkbox_tick);
        // set_value
        scr_checkbox_set_value(gObj, val);
        
        scr_checkbox_set_target(gObj, argument[3], argument[4]);
        
        component._component = gObj;
        break;
        
    case cbData_type.function:
        gObj = instance_create(xx, yy, obj_cbGUI_button);
        gObj.depth = gui.depth - 2;
        scr_button_set_sizes(gObj, gui._bodyW-17, 19);
        scr_button_set_sprite(gObj, spr_cbDataGUI_1x1);
        scr_button_set_padding(gObj, 1, 1);
        scr_button_set_font(gObj, gui.font);
        scr_button_set_font_align(gObj, fa_left, fa_middle);
        scr_button_set_color(gObj, 
            global._cbColors[_cbDataGUIColor.label],
            global._cbColors[_cbDataGUIColor.number],
            global._cbColors[_cbDataGUIColor.function],
            make_color_rgb(80, 80, 80)
        );
        scr_button_set_label(gObj, string(argument[4]));
        
        // setting the execution for mouse up
        scr_button_set_on_mouseup_cb(gObj, argument[4]);
        
        component._component = gObj;
        break;
        
    case cbData_type.color:
        /// DROPDOWN
        if (argument_count > 5) {
            var mult = argument[5];
            component._multiple = mult;
            
            gObj = instance_create(xx, yy, obj_cbGUI_dropdown);
            gObj.depth = gui.depth - 11;
            scr_dropdown_set_sprite(gObj, 
                spr_cbDataGUI_dropdown,
                spr_cbDataGUI_dropdown_ico, -1, -1
            );
            scr_dropdown_set_popup_offset(gObj, 0);
            scr_dropdown_set_padding(gObj, 5, 10);
            scr_dropdown_set_sizes(gObj, 142, 19);
            scr_dropdown_set_font(gObj, gui.font, gui.font);
            
            scr_dropdown_set_target(gObj, argument[3], argument[4]);
            
            scr_dropdown_set_list(gObj, mult);
            scr_dropdown_set_value(gObj, val);
            
        /// COLORPICKER    
        } else  {
            gObj = instance_create(xx, yy, obj_cbGUI_colorpicker);
            gObj.depth = gui.depth - 12;
            scr_colorpicker_set_ui_color(gObj,
                make_color_rgb(50, 50, 50),
                make_color_rgb(60, 60, 60),
                -1,
                -1,
                make_color_rgb(60, 60, 60),
                c_white,
                c_black
            );
            scr_colorpicker_show_info(gObj, true);
            scr_colorpicker_set_sizes(gObj, 142, 19, 1);
            scr_colorpicker_auto_copy_to_clipboard(gObj, true);
            
            scr_colorpicker_set_target(gObj, argument[3], argument[4]);
            
            // set_value
            scr_colorpicker_set_value(gObj, val);
        }
        component._component = gObj;
        break;
}
scr_cbGUI_set_gui_size(gui.guiSize);
return component;
