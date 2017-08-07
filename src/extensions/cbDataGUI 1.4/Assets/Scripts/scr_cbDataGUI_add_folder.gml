/// scr_cbDataGUI_add_folder(name, [optional:folder_instance]);
/**
* @brief  Creates a folder in the cbDataGUI panel. You will need the
*         returned folder instance to be able to put UI elements into it
*         by using scr_cbDataGUI_add script and passing it as 4th argument.
*
* @param  {string}   name              A Name for the folder. Any char is allowed.
* @param  {instance} [folder_instance] Optional: Instance of a folder if you
*                                      want to put folder into another folder.
*         
* @return {instance}  Returns a new created folder instance. Returns
*                     undefined if fails.
*/

var name = argument[0];
var obj;

var gui = instance_find(obj_cbDataGUI_controller, 0);
if (!instance_exists(gui)) gui = scr_cbDataGUI_create();

// create object
obj = instance_create(gui.x, 0, obj_cbDataGUI_folder);

// set params
obj._type = cbData_type.folder;
obj._isOpen = true;
obj._name = name;

switch (argument_count) {
    case 1:
        // add it to the controller array
        if (gui._component_array[@ 0] == undefined) {
            gui._component_array[0] = obj;
        } else {
            gui._component_array[array_length_1d(gui._component_array)] = obj;
        }
        break;
    case 2:
        var folder = argument[1];
        if (instance_exists(folder)) {
            // add it to the folder array
            if (folder._folderItems[@ 0] == undefined) {
                folder._folderItems[0] = obj;
            } else {
                folder._folderItems[array_length_1d(folder._folderItems)] = obj;
            }
            // set _folder to detect its a subfolder or not
            obj._folder = folder;
        }
        break;
}

return obj;
