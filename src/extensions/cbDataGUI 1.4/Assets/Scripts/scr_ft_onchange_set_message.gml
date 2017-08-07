if (!instance_exists(obj_fizzy_text)) return 0;
var ft = instance_find(obj_fizzy_text, 0);

with (ft) {
    scr_ft_set_message(other.value);
}
    
