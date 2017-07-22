// http://riven8192.blogspot.com.tr/2010/08/calculate-perlinnoise-twice-as-fast.html
switch (argument0 & 15) {
    case 0:  return  argument1 + argument2;
    case 1:  return -argument1 + argument2;
    case 2:  return  argument1 - argument2;
    case 3:  return -argument1 - argument2;
    case 4:  return  argument1 + argument3;
    case 5:  return -argument1 + argument3;
    case 6:  return  argument1 - argument3;
    case 7:  return -argument1 - argument3;
    case 8:  return  argument2 + argument3;
    case 9:  return -argument2 + argument3;
    case 10: return  argument2 - argument3;
    case 11: return -argument2 - argument3;
    case 12: return  argument2 + argument1;
    case 13: return -argument2 + argument3;
    case 14: return  argument2 - argument1;
    case 15: return -argument2 - argument3;
    default: return 0; // never happens
}
