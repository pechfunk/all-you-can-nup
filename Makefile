#!/usr/bin/env make
#----------------------------------------------------------------------
# All you can n-up
# a Makefile which applies a variety of multiple-page-printing strategies
# to whatever pdfs you provide.
#
# Currently, patterns are hard-coded, and you have to create new patterns.
#----------------------------------------------------------------------

PDFTOPS := pdftops
PSTOPS := pstops

PDFS := $(wildcard *.pdf)
PS_PLAIN := $(patsubst %.pdf,%.tmp.ps,$(PDFS))

PS_2COL2 := $(patsubst %.pdf,%.2col2.ps,$(PDFS))
PS_SD1COL2 := $(patsubst %.pdf,%.sd1col2.ps,$(PDFS))
PS_LNCS3 := $(patsubst %.pdf,%.lncs3.ps,$(PDFS))
PS_BOOKLET:= $(patsubst %.pdf,%.booklet.ps,$(PDFS))

.PHONY: all
all:	$(PS_2COL2) $(PS_SD1COL2) $(PS_LNCS3) $(PS_BOOKLET)

.PHONY: clean
clean:	
	rm -f *.ps


%.tmp.ps : %.pdf
	$(PDFTOPS) $^ $@

%.2col2.ps : %.tmp.ps
	$(PSTOPS) '2:0L@0.8(230mm,-8mm)+1L@0.8(230mm,134mm)' $^ $@

%.sd1col2.ps : %.tmp.ps
	$(PSTOPS) '2:0L@0.86(230mm,-8mm)+1L@0.86(230mm,134mm)' $^ $@

%.lncs3.ps : %.tmp.ps
	$(PSTOPS) '3:0L@0.7(210mm,-15mm)+1L@0.7(210mm,75mm)+2L@0.7(210mm,165mm)' $^ $@
%.booklet.ps : %.tmp.ps
	$(PSTOPS) "4:-3L@.7(21cm,0)+0L@.7(21cm,14.85cm),1R@.7(0cm,29.7cm)+-2R@.7(0cm,14.85cm)" $^ $@





