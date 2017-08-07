///_scr_radio_turnalloff();
var num = instance_number(obj_cbGUI_radio);
if (num <= 0) return undefined;

for (var i=0; i<=num; i++) {
    var o = instance_find(obj_cbGUI_radio, i);
    with (o) {
        if (group == other.group) {
            value = false;
        }
    }
}

