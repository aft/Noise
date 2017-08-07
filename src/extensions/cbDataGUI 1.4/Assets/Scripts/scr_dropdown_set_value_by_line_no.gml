///scr_dropdown_set_value_by_line_no(dropdown_instance, line_no_int);
var o = argument0;
if (!instance_exists(o)) return undefined;

with (o) {
    var ret = _scr_dropdown_setvaluebyitemno(floor(argument1));
    _changed = false; // prevent cb trigger
    return ret;
}
return false;
