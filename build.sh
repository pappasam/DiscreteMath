#!/bin/bash

# Declare name of text file and output pdf
TEXFILE=$1
PDFFILE=$(echo $TEXFILE | sed "s/.tex/.pdf/g")

# Run PDF creation command twice
for run in {1..2}
do
	pdflatex $TEXFILE
done

# Remove files used in the building process
for i in aux log
do
	rm *.$i
done

# Open the output PDF for viewing
gnome-open $PDFFILE
