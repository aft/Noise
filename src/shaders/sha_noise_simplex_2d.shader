
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
// Seed hack added by @aft. https://www.shadertoy.com/view/XsBcWy
// Original shader: https://github.com/ashima/webgl-noise/blob/master/src/noise2D.glsl
// Thank you Stefan Gustavson for all the work you have done.


#define OCTAVES 5 // CHANGE THIS AS YOU WISH

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
uniform float u_scale; // 1.
uniform float u_xoffset; // 0.
uniform float u_yoffset; // 0.


// Original code starts here

vec3 mod289(vec3 x) {
  return x - floor(x * (1.0 / 289.0)) * 289.0;
}

vec2 mod289(vec2 x) {
  return x - floor(x * (1.0 / 289.0)) * 289.0;
}

vec3 permute(vec3 x) {
  return mod289(((x*34.0)+1.0)*x); 
}

float snoise(vec2 v) {

  const vec4 C = vec4(0.211324865405187,  // (3.0-sqrt(3.0))/6.0
                      0.366025403784439,  // 0.5*(sqrt(3.0)-1.0)
                     -0.577350269189626,  // -1.0 + 2.0 * C.x
                      0.024390243902439); // 1.0 / 41.0
  
  v += cos(dot(vec4(u_seed * 1.4071341), C)) * 1e3; // seed addition by shifting pos.

// First corner
  vec2 i  = floor(v + dot(v, C.yy) );
  vec2 x0 = v -   i + dot(i, C.xx);

// Other corners
  vec2 i1;
  i1 = (x0.x > x0.y) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
  vec4 x12 = x0.xyxy + C.xxzz;
  x12.xy -= i1;

// Permutations
  i = mod289(i); // Avoid truncation effects in permutation
  vec3 p = permute( permute( i.y + vec3(0.0, i1.y, 1.0 ) )
                   + i.x + vec3(0.0, i1.x, 1.0 ) );

  vec3 m = max(0.5 - vec3(dot(x0,x0), dot(x12.xy,x12.xy), dot(x12.zw,x12.zw)), 0.0);
  m = m*m ;
  m = m*m ;

// Gradients: 41 points uniformly over a line, mapped onto a diamond.
// The ring size 17*17 = 289 is close to a multiple of 41 (41*7 = 287)

  vec3 x = 2.0 * fract(p * C.www) - 1.0;
  vec3 h = abs(x) - 0.5;
  vec3 ox = floor(x + 0.5);
  vec3 a0 = x - ox;

// Normalise gradients implicitly by scaling m
// Approximation of: m *= inversesqrt( a0*a0 + h*h );
  m *= 1.79284291400159 - 0.85373472095314 * ( a0*a0 + h*h );

// Compute final noise value at P
  vec3 g;
  g.x  = a0.x  * x0.x  + h.x  * x0.y;
  g.yz = a0.yz * x12.xz + h.yz * x12.yw;
  return 130.0 * dot(m, g);
}

// Original code ends here.

float getnoise_single(int octaves, float u_persistence, float u_freq, vec2 coords) {
    float sum = snoise(coords*u_freq); 
    return sum * .5 + .5;
}

float getnoise_fbm(int octaves, float u_persistence, float u_freq, vec2 coords) {
    float amp= 1.; 
    float maxamp = 0.;
    float sum = 0.;
    for (int i=0; i < octaves; ++i) {
        sum += amp * snoise(coords*u_freq); 
        u_freq *= 2.1;
        maxamp += amp;
        amp *= u_persistence;
    }
    return (sum / maxamp) * .5 + .5;
}

void main() {

    vec2 p = v_vPosition.xy / u_resolution.x * u_scale;
    vec2 offset = vec2(u_xoffset, u_yoffset) / u_resolution.x * u_scale;
    p += offset;
    float value = NOISE(OCTAVES, u_persistence, u_freq, p);
    gl_FragColor = vec4(vec3(value), 1.0);
    
}

