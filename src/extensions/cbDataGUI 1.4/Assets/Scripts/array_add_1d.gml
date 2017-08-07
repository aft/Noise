//array_add_1d(array1, item);
/**
* @brief  Updates an arrays by adding an item to the end. array = (array + item)
* @param  {array} array1 Array
* @param  {any} item Any data type
* @return {array}  Returns the updated array if successful, undefined if fails.
*/

if (!is_array(argument0)) return undefined;
argument0[@array_length_1d(argument0)] = argument1;
return argument0;


