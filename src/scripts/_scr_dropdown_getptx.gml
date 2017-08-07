switch (halign) {
    case fa_left:
        _popupTextX = _leftPadding;
        break;
    case fa_center:
        _popupTextX = ceil((_bodyW - _iconX)/ 2);
        break;
    case fa_right:
        _popupTextX = _bodyW - (_rightPadding + _iconX);
        break;
}

