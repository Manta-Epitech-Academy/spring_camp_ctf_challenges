const target =  [126, 100, 96, 125, 97, 104, 127, 104, 123, 104, 127, 126, 104];

function unlock(input) {
    if (input.length !== target.length) return false;

    for (let i = 0; i < input.length; i++) {
        if ((input.charCodeAt(i) ^ 13) !== target[i]) {
            return false;
        }
    }
    return true;
}
