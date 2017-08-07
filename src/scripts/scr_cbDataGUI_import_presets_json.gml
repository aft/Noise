/// scr_cbDataGUI_import_presets_json(json_string);
/**
* @brief  Imports presets from a JSON string. 
*
* @param  {String} json_string  Check source code for structure info
*         
* @return {Boolean} Returns undefined if fails. 
*                   Returns true if successful.
*
* @see scr_cbDataGUI_add_preset
* @see scr_cbDataGUI_save_preset
* @see scr_cbDataGUI_load_preset
* @see scr_cbDataGUI_delete_preset
* @see scr_cbDataGUI_get_preset_json
*/

// Here is the JSON Structure:
/*
{
   "presets":[
      {
         "Normal":{
            "growthSpeed":0.978261,
            "maxSize":5.652174,
         }
      },
      {
         "Fast":{
            "growthSpeed":1.543478,
            "maxSize":9,
         }
      }
   ],
   "preset":"Fast"
}
*/
var json = argument0;

var o = obj_cbDataGUI_preset;
if (!instance_exists(o)) return undefined;

with (o) {
    _scr_cbDataGUI_import_json_string(json);
    return true;
}
