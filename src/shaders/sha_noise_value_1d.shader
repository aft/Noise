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
#define NOISE getnoise1d_fbm
#else
#define NOISE getnoise1d_single
#endif

varying vec3 v_vPosition;

uniform vec2 u_resolution;
uniform float u_seed;
uniform float u_frame;
uniform float u_persistence;
uniform float u_freq;
uniform float u_scale; // 10.
uniform float u_xoffset; // 0.


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

float hash(float n) { return fract(sin(n + u_seed) * 1e4); } // seed addition

float noise(float x) {
    float i = floor(x);
    float f = fract(x);
    float u = f * f * (3.0 - 2.0 * f);
    return mix(hash(i), hash(i + 1.0), u);
}

float getnoise1d_single(int octaves, float u_persistence, float u_freq, float coords) {
    return noise(coords*u_freq);
}

float getnoise1d_fbm(int octaves, float u_persistence, float u_freq, float coords) {
    float amp= .5; 
    float maxamp = 0.;
    float sum = 0.;
    float shift = 100.;
    for (int i=0; i < octaves; ++i) {
        sum += amp * noise(coords*u_freq);
        coords = coords * 2.0 + shift;
        maxamp += amp;
        amp *= u_persistence;
    }
    return sum/maxamp;
}

void main() {

    float p = (v_vPosition.x / u_resolution.x) * u_scale;
    float offset = u_xoffset / u_resolution.x * u_scale;
    p += offset;
    float value = NOISE(OCTAVES, u_persistence, u_freq, p);
    gl_FragColor = vec4(vec3(value), 1.);
    
}

