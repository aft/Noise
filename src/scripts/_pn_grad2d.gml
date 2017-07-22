///_pn_grad2d(i, x, y);
var v;
if (argument0 & 1 == 0) v = argument1;
else v = argument2;
    
if (argument0 & 2 == 0) return -v;
else return v;

