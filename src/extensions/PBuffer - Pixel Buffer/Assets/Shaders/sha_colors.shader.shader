attribute vec3 in_Position;
varying vec2 v_vPosition;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vPosition = in_Position.xy;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~


varying vec2 v_vPosition;
uniform float iFrame;
uniform vec2 iResolution;

void main() {
/*
    // based on lennyjpg's application.
    
    vec2 uv = v_vPosition / iResolution.y;
    vec2 s = vec2(.0), c = vec2(.0);
    float sp = (sin(iFrame*0.03)+0.5)*0.5;
    sp *= 0.05;
    sp += 0.0001;
    float tt = iFrame*sp;

    tt += fract(sin(uv.x+1.0))*2.0;
    float e = 1.0+sin(uv.x*3.0)*2.6;
    float k = cos(tt-e) + 7.0;
    vec4 ok = vec4( abs( cos(tt + sin(0.5 * tt + (uv.x+tt*0.001) * k) ) ));

    vec3 pixel = vec3(1.2);
    float t = iFrame*0.037, d = 0.0, r = 0.0;

    for (float i=0.0; i<50.0; i+=1.0) {
    
        s = vec2(t + fract(sin(i*0.9)*37.0),t + fract(cos(i*2.5)*37.0));
        c.x = fract(cos(i*42.91 + s.x)*2.751) * 5.0 - 2.0;
        c.y = fract(sin(i*13.44 + s.y)*1.387) * 4.0 - 2.0;
        r = fract(sin((i*0.6))*5.0) * 0.67;
        c += ok.xy*vec2(0.3,-0.1);
        d = length(uv - c);
        
        float sstep = smoothstep(d*0.05,d,r*r)*0.87;
        if (int( mod(i,3.0)) == 0) {
            pixel.g -= sstep;
        } else if (int( mod(i,3.0)) == 1) {
            pixel.b -= sstep;
        } else if (int( mod(i,3.0)) == 2) {
            pixel.r -= sstep;
        }
        
        c.x = fract(cos(i*122.91 + s.x)*0.1751) * 5.0 - 2.0;
        c.y = fract(sin(i*73.44 + s.y)*0.387) * 4.0 - 2.0;
        r = fract(sin((i*0.4)+1.0)*0.2) * 0.00167;
        c += ok.xy*vec2(0.1,0.1);
        d = length(uv - c);
        
        float sstep2 = smoothstep(d*0.000000005,d,r)*0.537;
        if (int( mod(i+1.,3.0)) == 0) {
            pixel.b += sstep2;
        } else if (int( mod(i+1.,3.0)) == 1) {
            pixel.g -= sstep2;
        } else if (int( mod(i+1.,3.0)) == 2) {
            pixel.r -= sstep2;
        }

    }
*/

	   vec2 uv = v_vPosition / iResolution.y, 
    s = vec2(.0), 
    c = vec2(.0);
    vec2 vv = v_vPosition / iResolution.xy;
    vec3 pixel = vec3(1.2);
    float t = iFrame * 0.033, d = 0.0, r = 0.0;
    	for(float i=0.0; i<37.0; i+=1.0) {
       s = vec2(t + fract(sin(i*0.9)*37.0),t + fract(cos(i*2.5)*37.0));
       c.x = fract(cos(i*42.9 + s.x)*2.551) * 4.0 - 1.0;
       c.y = fract(sin(i*13.44 + s.y)*0.987) * 3.0 - 1.0;
       r = fract(sin((i*0.6))*5.0) * 0.67;
       c += vec2(0.3,0.1);
       d = length(uv - c);
       float sstep = smoothstep(d*0.05,d,r*r)*0.67;
       if (int( mod(i,3.0)) == 0) {
            pixel.g -= sstep/1.1;
            pixel.b -= sstep/0.6;
            pixel.r -= sstep/3.1;
       }
       
    }
    gl_FragColor = vec4(pixel.rgb, 1.0);

}

