=================
 All-you-can-nup
=================

This makefile converts PDFs to a variety of print-friendly 2-up and
3-up formats.

Usage
=====

Make sure that pdftops and pstops are installed and in your PATH.

Copy all your PDFs to a temp directory. Cd to the temp directory. Then
run all-you-can-nup in that directory. It will create all n-up formats
of all PDF files.

If a PDF file is called foo.pdf, you will get foo.FFF.ps for all the
following values of FFF:

2col2
  2-up 78% layout for duplex printing of two-column layouts (most ACM conference 
  proceedings). Upper margin is asymmetric for stapling in a corner
  after duplex printing.

sd1col2
  2-up 86% layout for Elsevier one-column layouts.

lncs3 
  3-up 70% for LNCS

booklet
  2-up 70% with pages reversed for stapling as a booklet after duplex printing.

gen2up
  2-up 71% for papers with hardly any margin
