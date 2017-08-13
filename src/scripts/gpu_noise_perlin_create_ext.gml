/// gpu_noise_perlin_create_ext(seed, width, height, persistence, frequency, scale);

var seed = argument[0];
var width = argument[1];
var height = argument[2];
var persistence = argument[3];
var frequency   = argument[4];
var scale       = argument[5];

var shader = sha_noise_perlin_3d;

var ret;
ret[0] = seed;
ret[1] = width;
ret[2] = height;
ret[3] = persistence;
ret[4] = frequency;
ret[5] = scale;
ret[6] = 0; // x offset
ret[7] = 0; // y offset
ret[8] = 0; // z offset
ret[9] = shader;
ret[10] = undefined; //nbuffer

return gpu_noise_perlin_calculate(ret);

