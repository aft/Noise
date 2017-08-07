if !validateEveryChar return true;

var ch = argument0;

for (var i=0; i <= string_length(allowedChars); i++) {
    if (ch == string_char_at(allowedChars, i)) return true;
}

return false;
