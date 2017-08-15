/// gpu_noise_perlin_create(seed, width, height);

/*
Create   256x256 gpu perlin noise ->  1.635 ms
Create 1024x1024 gpu perlin noise -> 13.425 ms
Create 2048x2048 gpu perlin noise -> 42.927 ms

Noise value lookup when z is not changing (will cache) -> 0.0035 ms per lookup
Noıse value lookup when z is changing (will not cache) -> 1.287 ms per lookup
*/


return gpu_noise_perlin_create_ext(argument[0], argument[1], argument[2], 0.65, 16.0, 1.0);
