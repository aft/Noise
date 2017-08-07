/// array_concat_1d(array1, array2);
/**
* @brief  Concatinates two arrays and returns a new one. array3 = (array1 + array2)
* @param  {array} array1 Array
* @param  {array} array2 Array
* @return {array}  Returns a new array if successful, undefined if fails.
*/

if (!is_array(argument0) && !is_array(argument1)) return undefined;

var r, a, c, i; 
r = argument0; a = argument1; c = array_length_1d(r); i = - 1;

while (++i < array_length_1d(a)) r[c+i]=a[i];
return r;


