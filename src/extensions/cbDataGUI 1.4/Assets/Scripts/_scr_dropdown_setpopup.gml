///_scr_dropdown_setpopup();

if (is_array(_visibleKeys)) _lineNo = array_length_1d(_visibleKeys);
else _lineNo = 0;

// calc values
_popupX1 = 0;
_popupY1 = _bodyH + _popupOffset;
_popupX2 = _bodyW;
_popupW = _popupX2 - _popupX1;

// check if scroll bar is needed
var lno;
if (_lineNo > _maxLineNo) {
    // scroll bar
    _scrollBar = true;
    lno = _maxLineNo;
} else {
    // no scroll bar
    _scrollBar = false;
    lno = _lineNo;
}

_popupH = lno * _popupLH + _popupTopPadding + _popupBottomPadding;
_popupY2 = _popupY1 + _popupH;

if (_lineNo == 0) _popupY2 = _popupY1 + 10; // allow empty popup. TODO: add text?

// scrollbar calcs
_scrollBarH = (_popupH - 2) / _lineNo * _maxLineNo;

_scr_dropdown_setscrollbar();
