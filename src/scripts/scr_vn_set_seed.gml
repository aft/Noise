/// scr_vn_set_seed(seed_int);

var new_seed;
var old_seed = random_get_seed();

if (argument_count > 0) new_seed = argument[0];
else {
    randomize();
    new_seed = irandom_range(10000, 9999999);
}

random_set_seed(new_seed);
global._vn_seed = new_seed;
random_set_seed(old_seed);



