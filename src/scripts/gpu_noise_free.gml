/// gpu_noise_free(noıse_object);

var o = argument0;
var ret = false;

// free surface and the buffer
if (surface_exists(o[@11])) {
    surface_free(o[@11]);
    o[@11] = undefined;
}

if (buffer_exists(o[@10])) {
    buffer_delete(o[@10]);
    o[@10] = undefined;
    ret = true;
}

return ret;
