///_scr_pn_generate_perm();

if (ds_map_exists(global._pn_p_bank, global._pn_seed))
    return global._pn_p_bank[? global._pn_seed];

// generate permutation
var p;
p[512] = 0; 

for (var i=0; i<256; ++i) p[i] = i; 

for(var i=0; i<256; ++i) { 
    var j = irandom(255),
        t = p[i]; 
    p[i] = p[j]; 
    p[j] = t;
}

// copy to avoid taking mod in p[0];
for(var i=0; i<256; ++i) { 
    p[i + 256] = p[i]; 
}

global._pn_p_bank[? global._pn_seed] = p;

return p;
