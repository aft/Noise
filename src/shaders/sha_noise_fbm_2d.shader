attribute vec3 in_Position;
varying vec3 v_vPosition;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vPosition = in_Position;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~

#define OCTAVES 5 // CHANGE THIS AS YOU WISH

#if (OCTAVES > 1)
#define NOISE getnoise2d
#else
#define NOISE getnoise2d_single
#endif

varying vec3 v_vPosition;

uniform vec2 u_resolution;
uniform float u_seed;
uniform float u_frame;
uniform float u_persistence; // .5
uniform float u_freq; // 1.
uniform float u_scale; // 20.

// Minor edits & seed support (offsetting) by Cem Baspinar. 
// https://www.shadertoy.com/view/4djcDG
// Reuse permitted under the BSD license.
//
// Based on Morgan McGuire's code. https://www.shadertoy.com/view/4dS3Wd
// By Morgan McGuire @morgan3d, http://graphicscodex.com
// Reuse permitted under the BSD license.

// All noise functions are designed for values on integer scale.
// They are tuned to avoid visible periodicity for both positive and
// negative coordinates within a few orders of magnitude.

float hash(vec2 p) { return fract(1e4 * sin(17.0 * p.x + p.y * 0.1) * (0.1 + abs(sin(p.y * 13.0 + p.x)))); }

float noise(vec2 x) {
    vec2 i = floor(x);
    vec2 f = fract(x);
    float a = hash(i);
    float b = hash(i + vec2(1.0, 0.0));
    float c = hash(i + vec2(0.0, 1.0));
    float d = hash(i + vec2(1.0, 1.0));
    vec2 u = f * f * (3.0 - 2.0 * f);
    return mix(a, b, u.x) + (c - a) * u.y * (1.0 - u.x) + (d - b) * u.x * u.y;
}

// Salt is added to limit the x,y values. No matter what you input,
// it returns a float around ~ 0-6001.
// I don't claim it to be undredictable, fast and uniform. 
// Feel free to adjust.
float salt(float seed) {
    if (seed == 0.) seed += 0.01;
    float a = mod(seed, 5901.);
    float b = mod(a,2.)==0. ? -0.01 : 0.11; 
    return mod(a+4179./sqrt(a*5.)*b+1001.*a/seed, 6001.);
}

float getnoise2d_single(int octaves, float u_persistence, float u_freq, vec2 coords) {
    return noise(coords*u_freq);
}

float getnoise2d(int octaves, float u_persistence, float u_freq, vec2 coords) {
    float amp= .5; 
    float maxamp = 0.;
    float sum = 0.;
    float shift = 100.;
    mat2 rot = mat2(cos(0.5), sin(0.5), -sin(0.5), cos(0.5));
    for (int i=0; i < octaves; ++i) {
        sum += amp * noise(coords*u_freq);
        coords = rot * coords * 2.0 + vec2(shift);
        maxamp += amp;
        amp *= u_persistence;
    }
    return sum/maxamp;
}

void main() {
    float ss = salt(u_seed);
    vec2 p = vec2(v_vPosition.xy / u_resolution.x * u_scale);
    float value = NOISE(OCTAVES, u_persistence, u_freq, p+vec2(ss));
    gl_FragColor = vec4(vec3(value), 1.);
}

