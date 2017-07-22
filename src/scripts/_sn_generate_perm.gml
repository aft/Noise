///_scr_sn_generate_perm();

if (ds_map_exists(global._sn_p_bank, global._sn_seed))
    return global._sn_p_bank[? global._sn_seed];

// generate permutation
var p;
p[512] = 0;

for (var i = 0; i < 256; i++) {
    p[i] = i;
}

for (var i = 0; i < 255; i++) {
    var r = i + ~~(random(1) * (256 - i));
    var aux = p[i];
    p[i] = p[r];
    p[r] = aux;
}

global._sn_p_bank[? global._sn_seed] = p;


return p;
