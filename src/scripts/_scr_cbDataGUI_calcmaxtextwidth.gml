// needs to run after folder change and tooltip change
// caller: component

_maxTextW = _c._bodyW - (_indent * _c._folderIndent + _c._colorW + _c._padding + 150);
if (_tooltip != noone) _maxTextW -= 28;
if (_type != cbData_type.folder) {
    _name = _scr_text_shorten(_targetVariable, _c.font, _maxTextW);
}

