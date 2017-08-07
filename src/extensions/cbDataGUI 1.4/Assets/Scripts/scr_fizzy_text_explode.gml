if (!instance_exists(obj_fizzy_text)) return 0;
var ft = instance_find(obj_fizzy_text, 0);

for (var i=0; i<array_length_1d(ft.particles); i++) {
    var rand = random(1) * 360;
    ft.particles[@i].vx = 30 * dcos(rand);
    ft.particles[@i].vy = 30 * dsin(rand);
}

    
