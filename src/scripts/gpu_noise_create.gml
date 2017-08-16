/// gpu_noise_create(noisetype, seed, width, height);

/*
Create   256x256 gpu perlin noise -> ~  1.7 ms
Create 1024x1024 gpu perlin noise -> ~ 13.5 ms
Create 2048x2048 gpu perlin noise -> ~ 43.0 ms

Noise value lookup when z is not changing (will cache) -> ~ 0.005 ms per lookup
Noıse value lookup when z is changing (will not cache) -> ~ 1.5 ms per lookup 
*/

return gpu_noise_create_ext(argument0, argument1, argument2, argument3, 0.65, 16.0, 1.0);
