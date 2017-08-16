/// gpu_noise_create_ext(noisetype, seed, width, height, persistence, frequency, scale);
/*

Noise Types
-----------
0 for Perlin Noise
1 for Simplex Noise
2 for Value Noise

*/

var ret;
ret[0] = argument1; // seed
ret[1] = argument2; // width
ret[2] = argument3; // height
ret[3] = argument4; // persistence
ret[4] = argument5; // frequency
ret[5] = argument6; // scale
ret[6] = 0; // x offset
ret[7] = 0; // y offset
ret[8] = 0; // z offset
ret[10] = undefined; // _nbuffer
ret[11] = undefined; // _surface

switch (argument0) {
    case 2: // Value noise
        ret[9] = sha_noise_value_3d;
        break;
    case 1: // Simplex noise
        ret[9] = sha_noise_simplex_3d;
        break;
    case 0: // Perlin noise
    default: // Perlin noise
        ret[9] = sha_noise_perlin_3d;
        break;
}

return _gpu_noise_calculate(ret);

