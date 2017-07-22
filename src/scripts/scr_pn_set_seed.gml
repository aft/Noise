///scr_pn_set_seed(seed_integer);
var new_seed;
var old_seed = random_get_seed();

if (argument_count > 0) new_seed = argument[0];
else {
    randomize();
    new_seed = irandom_range(1000000, 9999999);
}

random_set_seed(new_seed);
global._pn_seed = new_seed;
global._pn_p = _pn_generate_perm();

random_set_seed(old_seed);







