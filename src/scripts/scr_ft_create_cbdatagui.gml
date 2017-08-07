/// scr_ft_create_cbdatagui();
texture_set_interpolation(false);

scr_cbDataGUI_create();

scr_cbDataGUI_add(obj_fizzy_text, "message", cbData_type.text, -1);
scr_cbDataGUI_set_tooltip(obj_fizzy_text, "message", "Type a word to paint with particles. This is a string demo.");
scr_cbDataGUI_set_value(obj_fizzy_text, "message", obj_fizzy_text.message);
scr_cbDataGUI_set_on_change_cb(obj_fizzy_text, "message", scr_ft_onchange_set_message);

scr_cbDataGUI_add(obj_fizzy_text, "pSpeed", cbData_type.number, -1);
scr_cbDataGUI_set_tooltip(obj_fizzy_text, "pSpeed", "How fast do particles move? This is a ranged number demo");
scr_cbDataGUI_set_range(obj_fizzy_text, "pSpeed", -2.5, 2.5);
scr_cbDataGUI_set_value(obj_fizzy_text, "pSpeed", obj_fizzy_text.pSpeed);

scr_cbDataGUI_add(obj_fizzy_text, "growthSpeed", cbData_type.number, -1);
scr_cbDataGUI_set_tooltip(obj_fizzy_text, "growthSpeed", "How fast do particles change size?");
scr_cbDataGUI_set_range(obj_fizzy_text, "growthSpeed", -5, 5);
scr_cbDataGUI_set_value(obj_fizzy_text, "growthSpeed", obj_fizzy_text.growthSpeed);

scr_cbDataGUI_add(obj_fizzy_text, "displayOutline", cbData_type.boolean, -1);
scr_cbDataGUI_set_tooltip(obj_fizzy_text, "displayOutline", "Should we draw the mask? This is a boolean demo.");
scr_cbDataGUI_set_value(obj_fizzy_text, "displayOutline", obj_fizzy_text.displayOutline);

scr_cbDataGUI_add(obj_fizzy_text, "scr_fizzy_text_explode", cbData_type.function, -1);
scr_cbDataGUI_set_tooltip(obj_fizzy_text, "scr_fizzy_text_explode", "Click on this to make the particles explode. This is a function demo.");

var folder_flow = scr_cbDataGUI_add_folder("Flow");

// number, multiple choice
var arr;
arr[0] = 1;
arr[1] = 5;
arr[2] = 10;
arr[3] = 15;
arr[4] = 20;
arr[5] = 25;
arr[6] = 30;
arr[7] = 35;
arr[8] = 40;
arr[9] = 45;
arr[10] = 50;
scr_cbDataGUI_add(obj_fizzy_text, "noiseStrength", cbData_type.number, folder_flow, arr);
scr_cbDataGUI_set_tooltip(obj_fizzy_text, "noiseStrength", "How turbulent is the flow? This is an array demo.");
scr_cbDataGUI_set_value(obj_fizzy_text, "noiseStrength", obj_fizzy_text.noiseStrength);
scr_cbDataGUI_set_on_change_cb(obj_fizzy_text, "noiseStrength", scr_ft_onchange_update_flow_field);

scr_cbDataGUI_add(obj_fizzy_text, "noiseScale", cbData_type.number, folder_flow);
scr_cbDataGUI_set_tooltip(obj_fizzy_text, "noiseScale", "Size of the flow noise. Step size is 1.");
scr_cbDataGUI_set_step(obj_fizzy_text, "noiseScale", 1);
scr_cbDataGUI_set_range(obj_fizzy_text, "noiseScale", 1, 10);
scr_cbDataGUI_set_value(obj_fizzy_text, "noiseScale", obj_fizzy_text.noiseScale);
scr_cbDataGUI_set_on_change_cb(obj_fizzy_text, "noiseScale", scr_ft_onchange_update_flow_field);

var dsm = ds_map_create();
ds_map_add(dsm, "Hide", 0);
ds_map_add(dsm, "Show", 1);
scr_cbDataGUI_add(obj_fizzy_text, "displayFlowNoise", cbData_type.number, folder_flow, dsm);
ds_map_destroy(dsm);
scr_cbDataGUI_set_tooltip(obj_fizzy_text, "displayFlowNoise", "Draw the noise that creates the flow field. This is a ds_map demo.");
scr_cbDataGUI_set_value(obj_fizzy_text, "displayFlowNoise", obj_fizzy_text.displayFlowNoise);

var folder_size = scr_cbDataGUI_add_folder("Particle Size");
scr_cbDataGUI_add(obj_fizzy_text, "minSize", cbData_type.number, folder_size);
scr_cbDataGUI_set_tooltip(obj_fizzy_text, "minSize", "Minimum size of a particle.");
scr_cbDataGUI_set_range(obj_fizzy_text, "minSize", 0, 5);
scr_cbDataGUI_set_value(obj_fizzy_text, "minSize", obj_fizzy_text.minSize);
scr_cbDataGUI_add(obj_fizzy_text, "maxSize", cbData_type.number, folder_size);
scr_cbDataGUI_set_tooltip(obj_fizzy_text, "maxSize", "How big can they get?");
scr_cbDataGUI_set_range(obj_fizzy_text, "maxSize", 5, 20);
scr_cbDataGUI_set_value(obj_fizzy_text, "maxSize", obj_fizzy_text.maxSize);
scr_cbDataGUI_open_folder(folder_size, false);

var folder_look = scr_cbDataGUI_add_folder("Look");
scr_cbDataGUI_add(obj_fizzy_text, "pAlpha", cbData_type.number, folder_look);
scr_cbDataGUI_set_tooltip(obj_fizzy_text, "pAlpha", "Opacity of a particle.");
scr_cbDataGUI_set_range(obj_fizzy_text, "pAlpha", 0, 1);
scr_cbDataGUI_set_value(obj_fizzy_text, "pAlpha", obj_fizzy_text.pAlpha);
scr_cbDataGUI_open_folder(folder_look, true);

var folder_sub_color = scr_cbDataGUI_add_folder("Colors", folder_look);
scr_cbDataGUI_add(obj_fizzy_text, "color1", cbData_type.color, folder_sub_color);
scr_cbDataGUI_set_value(obj_fizzy_text, "color1", obj_fizzy_text.color1);
scr_cbDataGUI_add(obj_fizzy_text, "color2", cbData_type.color, folder_sub_color);
scr_cbDataGUI_set_value(obj_fizzy_text, "color2", obj_fizzy_text.color2);
scr_cbDataGUI_add(obj_fizzy_text, "color3", cbData_type.color, folder_sub_color);
scr_cbDataGUI_set_value(obj_fizzy_text, "color3", obj_fizzy_text.color3);
scr_cbDataGUI_add(obj_fizzy_text, "color4", cbData_type.color, folder_sub_color);
scr_cbDataGUI_set_value(obj_fizzy_text, "color4", obj_fizzy_text.color4);
scr_cbDataGUI_open_folder(folder_sub_color, true);

scr_cbDataGUI_use_presets(true);

