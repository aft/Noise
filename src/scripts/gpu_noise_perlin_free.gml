/// gpu_noise_perlin_free(noıse_object);

var o = argument0;
if (buffer_exists(o[@10])) {
    buffer_delete(o[@10]);
    return true;
} else return false;
