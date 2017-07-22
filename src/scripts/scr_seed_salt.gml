///scr_seed(integer);
// int                2147483647
// int64     9223372036854775807
// gms int64 9223372036854775299

/*// millions
var a = argument0 & $fffffff;
return ((1234131 + a * 0.523413187) * sqrt(1111111113 + a * 0.17777777)) & $fffffff;
*/

// t: current time, b: begInnIng value, c: change In value, d: duration
//return -c *(t/=d)*(t-2) + b;

var i = argument0;
var a = i mod 5901;
var b;
// b = a % 2==0 ? -0.01 : 0.11; 
if (a mod 2 == 0) b = -0.01;
else b = 0.11;
var res = floor(a + 4179/ sqrt(a*5)*b + 1001*a / i );
return res;
