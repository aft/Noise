///_scr_getnearestpower(num, powerof);
// ugly way
// TODO: use bitwise ops to do this cleaner

var num = argument0, pow = argument1;
for (var i=0; i < 99; i++) { 
    if (power(pow, i) >= num) break; 
}
return i;
