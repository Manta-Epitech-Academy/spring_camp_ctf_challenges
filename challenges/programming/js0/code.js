const target = [107, 102, 100, 98, 126, 50, 51];

function unlock(input) {
    if (input.length !== target.length) return false;

    for (let i = 0; i < input.length; i++) {
        if ((input.charCodeAt(i) ^ 13) !== target[i]) {
            return false;
        }
    }
    return true;
}
