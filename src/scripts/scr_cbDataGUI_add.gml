/// scr_cbDataGUI_add(target_obj, target_variable_str, cbData_type, folder_object_or_-1, [optional: multiple_choice]);
/**
* @brief  <p>Adds a object variable modifier to the cbDataGUI. You have these
*         data types built in:<p>
*
*         <ul><li>string   (modified with a textbox)</li>
*         <li>number  (modified with a slider)</li>
*         <li>boolean  (modified with a checkbox)</li>
*         <li>function (triggered with a button)</li>
*         <li>color    (modified with a colorpicker)</li></ul>
*
*         <p>You also have the option to use dropbox ui elements if you want to
*         have multiple choice parameters. The return value of the dropboxs 
*         can be string, number, boolean or a color.</p>
*
*         <p>To add one of these, you need to specify a target object and a
*         target variable as arguments.</p>
*
*         <p>Because of GMS limitations, you need to specify what type of data
*         is going to be modified with an argument. (I know, right?)</p>
*         
*         <p><strong>Important Note: You don't have to specify an object to be modified.
*         If you don't prefer to use target modifying feature or if you are
*         using GM:S 1.4, specify "none" as a target object. Note that
*         you will have to use none as a target object for all other scripts
*         that require a target object too.</strong></p>
*
*         <p>Example of not using target object</p>
*
*         <pre>scr_cbDataGUI_add(<strong>none</strong>, "radius", cbDataType.number, -1);
*         scr_cbDataGUI_set_value(<strong>none</strong>, "radius", 10.0);</pre>
*
* @param  {instance} target_obj          An object instance to be targeted. Use "none" 
*                                        if you don't want it to manipulate any object
* @param  {string}   target_variable_str An instance variable name as a string. 
*                                        (Eg. If you want to change obj.radius, 
*                                        use "radius")
* @param  {number}  cbData_type         Check _scr_cbDataGUI_init script to see 
*                                        cbData_type enum. (Eg. cbData_type.number)
* @param  {instance} folder              Folder instance or use -1 if you don't want 
*                                        to use a folder.
* @param  {multiple} [multiple_choice]   Optional: Array or ds_map can be passed 
*                                        to use multiple choices. If you use this, 
*                                        the user will see a dropdown box instead.
*         
* @return {instance}  Returns a new created GUI controller, however 
*                     you won't need this instance normally. Returns
*                     undefined if fails.
*/

var targetObject = argument[0];
var varName = argument[1];
var type = argument[2];
var folder = argument[3];
var obj;

var gui = instance_find(obj_cbDataGUI_controller, 0);
if (!instance_exists(gui)) gui = scr_cbDataGUI_create();

// create object
if (argument_count == 4) {
    obj = _scr_cbDataGUI_add(gui.x, 0, type, targetObject, string(varName));
} else if (argument_count == 5) {
    // argument4 is array, ds_list or ds_map
    obj = _scr_cbDataGUI_add(gui.x, 0, type, targetObject, string(varName), argument[4]);
}

if (folder == -1 || folder == noone || folder == undefined) {
    // add it to the controller array
    if (gui._component_array[@ 0] == undefined) {
        gui._component_array[0] = obj;
    } else {
        gui._component_array[array_length_1d(gui._component_array)] = obj;
    }
} else {
    // folder object
    if (instance_exists(folder)) {
        // add it to the folder array
        if (folder._folderItems[@ 0] == undefined) {
            folder._folderItems[0] = obj;
        } else {
            folder._folderItems[array_length_1d(folder._folderItems)] = obj;
        }            
    }
}

_scr_cbDataGUI_processrows();
return obj;
