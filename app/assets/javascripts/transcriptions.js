function transposeChord(chord, amount) {
    var scale = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];

    return chord.replace(/[CDEFGAB]#?/g,
        function(match) {
            var i = (scale.indexOf(match) + amount) % scale.length;
            return scale[ i < 0 ? i + scale.length : i ];
        });
}

console.log(transposeChord("Dm7/G", 2)); // gives "Em7/A"
console.log(transposeChord("Fmaj9#11", -23)); // gives "F#maj9#11"
