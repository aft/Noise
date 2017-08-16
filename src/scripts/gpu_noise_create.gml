/// gpu_noise_create(noisetype, seed, width, height);
/*

Noise Types
-----------
0 for Perlin Noise
1 for Simplex Noise
2 for Value Noise

Some Benchmark Results
----------------------

Create   256x256 gpu perlin noise -> ~  1.7 ms
Create 1024x1024 gpu perlin noise -> ~ 13.5 ms
Create 2048x2048 gpu perlin noise -> ~ 43.0 ms

Perlin noise value lookup when z is not changing (will cache) -> ~ 0.005 ms per lookup
Perlin noıse value lookup when z is changing (will not cache) -> ~ 1.5 ms per lookup 

*/

return gpu_noise_create_ext(argument0, argument1, argument2, argument3, 0.65, 16.0, 1.0);
