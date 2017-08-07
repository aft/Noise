/// hex_to_color(hex)

// Modified by Cem Baspinar to return GMS color.
// Original code: http://www.gmlscripts.com/script/hex_to_rgb

//  Depends on hex_to_dec().
//
//      hex         hexadecimal color in RRGGBB format, string
//
/// GMLscripts.com/license

{
    var color,rgb;
    color = hex_to_dec(argument0);
    var r = color & 255;
    var g = (color & 65280) >> 8;
    var b = (color & 16711680) >> 16;
    return make_color_rgb(r, g, b);
}
