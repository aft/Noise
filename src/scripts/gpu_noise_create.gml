/// gpu_noise_create(noisetype, seed, width, height);

/*

Create   256x256 gpu perlin noise ->  1.635 ms     1.864
Create 1024x1024 gpu perlin noise -> 13.425 ms    13.255
Create 2048x2048 gpu perlin noise -> 42.927 ms    42.788

Noise value lookup when z is not changing (will cache) -> 0.0030 ms per lookup
Noıse value lookup when z is changing (will not cache) -> 1.287 ms per lookup 

2.131  
1.491 
1.694
1.707
2.382
1.780

*/


return gpu_noise_create_ext(argument0, argument1, argument2, argument3, 0.65, 16.0, 1.0);
