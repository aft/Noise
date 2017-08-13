/*
THIS SHADER IS DEMO PURPOSES ONLY. DO NOT USE IT
*/

attribute vec3 in_Position;
varying vec3 v_vPosition;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vPosition = in_Position;
    
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~
// Adapted for GMS by Cem Baspinar. Shadertoy page for it linked below.
//
// A Note from @aft: 
// On the page linked below, you will see a discussion that reveals 
// Stefan Gustavson's opinion on adding a seed support. He himself 
// says that it has a performance cost and this shall be done by 
// offsetting coords. This code is a coordinate offset hack.
//
// Reuse permitted under the MIT license.
//
// Seed hack added by @aft. https://www.shadertoy.com/view/4dBcWy
// Original shader: https://github.com/ashima/webgl-noise/blob/master/src/noise3D.glsl
// Thank you Stefan Gustavson for all the work you have done.


#define OCTAVES 5 // CHANGE THIS AS YOU WISH
#define DEMO_MODE // Comment out this line. It is only needed for a demo.

#if (OCTAVES > 1)
#define NOISE getnoise_fbm
#else
#define NOISE getnoise_single
#endif

varying vec3 v_vPosition;

uniform vec2 u_resolution;
uniform float u_seed;
uniform float u_frame;
uniform float u_persistence;
uniform float u_freq;
uniform float u_scale;
uniform float u_xoffset; // 0.
uniform float u_yoffset; // 0.
uniform float u_zoffset; // 0.

// Original code starts here

vec3 mod289(vec3 x) {
  return x - floor(x * (1.0 / 289.0)) * 289.0;
}

vec4 mod289(vec4 x) {
  return x - floor(x * (1.0 / 289.0)) * 289.0;
}

vec4 permute(vec4 x) {
     return mod289(((x*34.0)+1.0)*x);
}

vec4 taylorInvSqrt(vec4 r) {
  return 1.79284291400159 - 0.85373472095314 * r;
}

float snoise(vec3 v) {

  const vec2  C = vec2(0.1666666666666667, 0.3333333333333333) ; // 1.0/6.0, 1.0/3.0
  const vec4  D = vec4(0.0, 0.5, 1.0, 2.0);

  v += cos(dot(vec2(u_seed, u_seed * 1.4071341), C)) * 1e3; // seed addition by shifting pos.

// First corner
  vec3 i  = floor(v + dot(v, C.yyy) );
  vec3 x0 =   v - i + dot(i, C.xxx) ;

// Other corners
  vec3 g = step(x0.yzx, x0.xyz);
  vec3 l = 1.0 - g;
  vec3 i1 = min( g.xyz, l.zxy );
  vec3 i2 = max( g.xyz, l.zxy );

  vec3 x1 = x0 - i1 + C.xxx;
  vec3 x2 = x0 - i2 + C.yyy; // 2.0*C.x = 1/3 = C.y
  vec3 x3 = x0 - D.yyy;      // -1.0+3.0*C.x = -0.5 = -D.y

// Permutations
  i = mod289(i); 
  vec4 p = permute( permute( permute( 
             i.z + vec4(0.0, i1.z, i2.z, 1.0 ))
           + i.y + vec4(0.0, i1.y, i2.y, 1.0 )) 
           + i.x + vec4(0.0, i1.x, i2.x, 1.0 ));

// Gradients: 7x7 points over a square, mapped onto an octahedron.
// The ring size 17*17 = 289 is close to a multiple of 49 (49*6 = 294)
  float n_ = 0.142857142857; // 1.0/7.0
  vec3  ns = n_ * D.wyz - D.xzx;

  vec4 j = p - 49.0 * floor(p * ns.z * ns.z);  //  mod(p,7*7)

  vec4 x_ = floor(j * ns.z);
  vec4 y_ = floor(j - 7.0 * x_ );    // mod(j,N)

  vec4 x = x_ *ns.x + ns.yyyy;
  vec4 y = y_ *ns.x + ns.yyyy;
  vec4 h = 1.0 - abs(x) - abs(y);

  vec4 b0 = vec4( x.xy, y.xy );
  vec4 b1 = vec4( x.zw, y.zw );

  //vec4 s0 = vec4(lessThan(b0,0.0))*2.0 - 1.0;
  //vec4 s1 = vec4(lessThan(b1,0.0))*2.0 - 1.0;
  vec4 s0 = floor(b0)*2.0 + 1.0;
  vec4 s1 = floor(b1)*2.0 + 1.0;
  vec4 sh = -step(h, vec4(0.0));

  vec4 a0 = b0.xzyw + s0.xzyw*sh.xxyy ;
  vec4 a1 = b1.xzyw + s1.xzyw*sh.zzww ;

  vec3 p0 = vec3(a0.xy,h.x);
  vec3 p1 = vec3(a0.zw,h.y);
  vec3 p2 = vec3(a1.xy,h.z);
  vec3 p3 = vec3(a1.zw,h.w);

//Normalise gradients
  vec4 norm = taylorInvSqrt(vec4(dot(p0,p0), dot(p1,p1), dot(p2, p2), dot(p3,p3)));
  p0 *= norm.x;
  p1 *= norm.y;
  p2 *= norm.z;
  p3 *= norm.w;

// Mix final noise value
  vec4 m = max(0.6 - vec4(dot(x0,x0), dot(x1,x1), dot(x2,x2), dot(x3,x3)), 0.0);
  m = m * m;
  return 42.0 * dot( m*m, vec4( dot(p0,x0), dot(p1,x1), 
                                dot(p2,x2), dot(p3,x3) ) );
  }

// Original code ends here.

float getnoise_single(int octaves, float u_persistence, float u_freq, vec3 coords) {
    float sum = snoise(coords*u_freq); 
    return sum * .5 + .5;
}

float getnoise_fbm(int octaves, float u_persistence, float u_freq, vec3 coords) {

    float amp= 1.; 
    float maxamp = 0.;
    float sum = 0.;
   
    for (int i=0; i < octaves; i++) {
        sum += amp * snoise(coords*u_freq); 
        u_freq *= 2.;
        maxamp += amp;
        amp *= u_persistence;
    }
    
    return (sum / maxamp) * .5 + .5;
}

// This function is only for a demo. You may remove this 
// and ifdef block in the main function.
vec3 use_time(vec3 p) {
    p.z = u_frame / u_resolution.x * 0.15;
    return p;
}

void main() {

    vec3 p = vec3(v_vPosition.xyz/u_resolution.x * u_scale);
    vec3 offset = vec3(u_xoffset, u_yoffset, u_zoffset) / u_resolution.x * u_scale;
    
    #ifdef DEMO_MODE 
        p =  use_time(p);
    #endif
    
    p += offset;
    float value = NOISE(OCTAVES, u_persistence, u_freq, p);
    gl_FragColor = vec4(vec3(value), 1.0);
    
}

