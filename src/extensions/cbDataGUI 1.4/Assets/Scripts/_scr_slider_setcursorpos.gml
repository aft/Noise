///_scr_slider_setcursorpos(x);
// updates cursorX, value, _perc
_cursorX = clamp(argument0, 0, _iW);

if (_stepValue != undefined) {
    // step value present
    var stepCount = round(abs(maxLimit-minLimit) / _stepValue);
    var spx = _iW / stepCount;
    var currentStep = round(_cursorX / spx);
    _cursorX = clamp(currentStep * spx, 0, _iW);
    //_perc = currentStep / stepCount;  // same result as below
}

//_perc = abs(_cursorX / _iW);
//value = min(minLimit, maxLimit) + abs(maxLimit-minLimit)*_perc;
_scr_slider_setvalue(min(minLimit, maxLimit) + abs(maxLimit-minLimit) * abs(_cursorX / _iW));
// changed

