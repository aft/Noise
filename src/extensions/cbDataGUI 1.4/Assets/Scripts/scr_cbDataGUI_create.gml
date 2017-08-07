/// scr_cbDataGUI_create();
/**
* @brief  Creates a cbDataGUI instance. You can only have one working
*         cbDataGUI instance per room. This is the first script you
*         will need use to create a cbDataGUI.
*         
* @return {instance}  Returns a new created gui controller, however 
*                     you won't need this instance normally.
*/

_scr_cbDataGUI_init();
return instance_create(0, 0, obj_cbDataGUI_controller);
