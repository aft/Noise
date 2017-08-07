///_scr_slider_setrange(i, j);
minLimit = min(argument0, argument1);
maxLimit = max(argument0, argument1);

if (value == undefined) {
    value = max(minLimit, maxLimit);
    _scr_slider_setperc(1);
    _scr_slider_getcursorpos();
} else {
    _scr_slider_setvalue(value);
}
