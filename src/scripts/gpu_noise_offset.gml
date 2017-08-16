/// gpu_noise_offset(noise_object, x, [y, z]);

var o = argument[0];
o[@6] = argument[1];                         // x offset
if (argument_count > 2) o[@7] = argument[2]; // y offset
if (argument_count > 3) o[@8] = argument[3]; // z offset

return _gpu_noise_calculate(o);
