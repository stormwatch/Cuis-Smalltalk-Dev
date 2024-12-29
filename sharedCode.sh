set -uo pipefail

repositories=(AMQP AnimatedGIF Cairo Calendars CodeExamples Cuis-Smalltalk-Tools Cuis-Smalltalk-UI EnhancedText Erudite firmata Games GeographicInformationSystems Learning-Cuis Machine-Learning Measures Morphic Numerics OSProcess Parsers StyledTextEditor SVG VMMaker TheCuisBook Cuis-Smalltalk.github.io Cuis-Website Cuis-Smalltalk-Historical Cuis-Smalltalk-Regex)

function pushd() {
    command pushd "$@" > /dev/null
}

function popd() {
    command popd "$@" > /dev/null
}
