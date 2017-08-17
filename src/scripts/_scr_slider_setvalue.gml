///_scr_slider_setvalue(x);
// updates cursorX, value, _perc

if (minLimit != undefined && maxLimit != undefined) {
    value = clamp(real(argument0), min(minLimit, maxLimit), max(minLimit, maxLimit));
} else {
    value = real(argument0);
    minLimit = min(0, value);
    maxLimit = max(0, value);
}

_perc = abs((value-minLimit) / (maxLimit-minLimit));
_scr_slider_getcursorpos();

// changed
if (value != undefined && value != previousValue) {
    previousValue = value;
    _changed = true;
    _modifyTarget = true;
}



