buildFolder=./build
includes=$(wildcard *.liy)
targets=$(foreach source,$(wildcard *.ly),${buildFolder}/$(basename $(source)).pdf)

default: $(targets)

${buildFolder}/%.pdf: %.ly ${includes} ${buildFolder}
	lilypond  --output="$(basename $@)" "$<"

${buildFolder}:
	mkdir --parents "${buildFolder}"
	