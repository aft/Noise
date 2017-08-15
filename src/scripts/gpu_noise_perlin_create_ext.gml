/// gpu_noise_perlin_create_ext(seed, width, height, persistence, frequency, scale);

var ret;
ret[0] = argument[0];
ret[1] = argument[1];
ret[2] = argument[2];
ret[3] = argument[3];
ret[4] = argument[4];
ret[5] = argument[5];
ret[6] = 0; // x offset
ret[7] = 0; // y offset
ret[8] = 0; // z offset
ret[9] = sha_noise_perlin_3d;
ret[10] = undefined; //nbuffer
ret[11] = undefined; //surface

return gpu_noise_perlin_calculate(ret);

