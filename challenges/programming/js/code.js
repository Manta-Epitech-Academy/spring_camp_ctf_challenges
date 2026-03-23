const vault = [8,118,111,115,38,113,236,119,76,118,11,101,108,102,215,109,202,113,171,108,50,102];

function verify(flag) {
    let flagIndex = 0;

    for (let i = 0; i < vault.length; i++) {
        if (i % 2 === 1) {
            if (flagIndex >= flag.length) {
		console.log("Accès refusé.");
                return false; 
            }
            let c = flag.charCodeAt(flagIndex);
            
            if ((c ^ 7) + 3 !== vault[i]) {
                console.log("Accès refusé.");
                return false;
            }
            flagIndex++;
        } else {
            continue; 
        }
    }
    if (flagIndex === 11) {
        console.log("Accès accordé !");
        return true;
    }
    console.log("Accès refusé.");
    return false;
}
