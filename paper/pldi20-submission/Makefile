#
# Makefile for Rite
#

all:
	@latexmk -pdf main

watch:
	@latexmk -pdf -pvc main

clean:
	@latexmk -c main

distclean: clean
	$(RM)  *.pdf

#
# Archive for distribution
#
archive:  all clean
	COPYFILE_DISABLE=1 tar -czvf ../rite.tgz --exclude '*~' --exclude '*.tgz' --exclude '*.zip'  --exclude CVS --exclude '.git*' .
