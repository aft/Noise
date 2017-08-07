///_scr_dropdown_setscrollbar();
// should run after every mouse wheel up and down

var lno;
if (_scrollBar) lno = _maxLineNo;
else lno = _lineNo;

_lineOffset = clamp(_lineOffset, 0, max(0, _lineNo - _maxLineNo));

_sbX1 = _popupX2 - 2 * _scrollBarRightPadding - _scrollBarW;
_sbY1 = _popupY1 + (_lineOffset * _scrollBarH / lno) + _scrollBarTopPadding;
_sbX2 = _popupX2 - 2 * _scrollBarRightPadding;
_sbY2 = _popupY1 + (_lineOffset * _scrollBarH / lno) + _scrollBarH;

