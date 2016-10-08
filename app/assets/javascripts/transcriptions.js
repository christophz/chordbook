$(document).ready(function () {

    var match;
    var chords =
        ['C','C#','D','Eb','E','F','F#','G','Ab','A','Bb','B','C',
         'Db','D','D#','E','F','Gb','G','G#','A','A#','C'];
    var chordRegex = /C#|D#|F#|G#|A#|Db|Eb|Gb|Ab|Bb|C|D|E|F|G|A|B/g;

    function transpose(that, direction) {
        var currentChord = that.text();
        var output = "";
        var parts = currentChord.split(chordRegex);
        var index = 0;
        while (match = chordRegex.exec(currentChord))
        {
            if (direction == "up") {
                var chordIndex = chords.indexOf(match[0]);
                output += parts[index++] + chords[chordIndex+1];
            } else if (direction == "down") {
                var chordIndex = chords.indexOf(match[0],1);
                output += parts[index++] + chords[chordIndex-1];
            }
        }
        output += parts[index];
        that.text(output);
    }

    $('#transposeUp').click(function() {
        $('#transcription em').each(function() {
            transpose($(this), "up");
        });

        $('.transcription__key').each(function() {
            transpose($(this), "up");
        });
    });

    $('#transposeDown').click(function() {
        $('#transcription em').each(function() {
            transpose($(this), "down");
        });

        $('.transcription__key').each(function() {
            transpose($(this), "down");
        });
    });
});
