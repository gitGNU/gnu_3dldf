#### Makefile
#### Created by Laurence D. Finston (LDF) Wed Mar  5 12:07:54 CET 2014

#### * Copyright and License.

#### This file is part of GNU 3DLDF, a package for three-dimensional drawing. 
#### Copyright (C) 2014 The Free Software Foundation                          

#### GNU 3DLDF is free software; you can redistribute it and/or modify 
#### it under the terms of the GNU General Public License as published by 
#### the Free Software Foundation; either version 3 of the License, or 
#### (at your option) any later version. 

#### GNU 3DLDF is distributed in the hope that it will be useful, 
#### but WITHOUT ANY WARRANTY; without even the implied warranty of 
#### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
#### GNU General Public License for more details. 

#### You should have received a copy of the GNU General Public License 
#### along with GNU 3DLDF; if not, write to the Free Software 
#### Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA 

#### GNU 3DLDF is a GNU package.  
#### It is part of the GNU Project of the  
#### Free Software Foundation 
#### and is published under the GNU General Public License. 
#### See the website http://www.gnu.org 
#### for more information.   
#### GNU 3DLDF is available for downloading from 
#### http://www.gnu.org/software/3dldf/LDF.html. 

#### (``@@'' stands for a single at-sign in the following paragraph.) 

#### Please send bug reports to Laurence.Finston@@gmx.de 
#### The mailing list help-3dldf@@gnu.org is available for people to 
#### ask other users for help.  
#### The mailing list info-3dldf@@gnu.org is for sending 
#### announcements to users. To subscribe to these mailing lists, send an 
#### email with ``subscribe <email-address>'' as the subject.  

#### The author can be contacted at: 

#### Laurence D. Finston 
#### Kreuzbergring 41 
#### D-37075 Goettingen 
#### Germany 

#### Laurence.Finston@@gmx.de (@@ stands for a single ``at'' sign.)



EXTRA_DIST = test_input.txt

sudoku.cxx : sudoku.web
	ctangle sudoku.web
	mv sudoku.c sudoku.cxx

sudoku.o: sudoku.cxx cmdlnopt.hxx dgrmtype.hxx fldtype.hxx
	g++ -D DEBUG_COMPILE=1 -I. -c -g -o sudoku.o sudoku.cxx

fldtype.cxx fldtype.hxx: fldtype.web
	ctangle fldtype.web
	mv fldtype.c fldtype.cxx

fldtype.o: fldtype.cxx
	g++ -D DEBUG_COMPILE=1 -I. -c -g -o fldtype.o fldtype.cxx

dgrmtype.cxx dgrmtype.hxx: dgrmtype.web
	ctangle dgrmtype.web
	mv dgrmtype.c dgrmtype.cxx

dgrmtype.o: dgrmtype.cxx fldtype.hxx
	g++ -D DEBUG_COMPILE=1 -I. -c -g -o dgrmtype.o dgrmtype.cxx


cmdlnopt.cxx cmdlnopt.hxx: cmdlnopt.web
	ctangle cmdlnopt.web
	mv cmdlnopt.c cmdlnopt.cxx

cmdlnopt.o: cmdlnopt.cxx
	g++ -D DEBUG_COMPILE=1 -I. -c -g -o cmdlnopt.o cmdlnopt.cxx

#### Link sudoku

sudoku$(EXEEXT): sudoku.o cmdlnopt.o dgrmtype.o fldtype.o scanner.o
	g++ -o sudoku$(EXEEXT) sudoku.o cmdlnopt.o dgrmtype.o fldtype.o scanner.o


#### 

prbsnflx$(EXEEXT): prbsnflx.c++ 
	g++ -g -o prbsnflx$(EXEEXT) prbsnflx.c++

prbsnflx.c++: prbsnflx.l++
	flex prbsnflx.l++
	mv lex.yy.c prbsnflx.c++
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat prbsnflx.c++ >> AAAtmp.txt
	@mv AAAtmp.txt prbsnflx.c++

#### *** (3) scanner

scanner.o: scanner.c++ dgrmtype.hxx fldtype.hxx
	g++ -D DEBUG_COMPILE=1 -I. -c -g -o scanner.o scanner.c++

scanner.c++ scanner.h++: scanner.l++
	flex scanner.l++
	mv lex.yy.c scanner.c++

scanner.l++ scanner1.h++: scanner.web prbsnflx
	ctangle scanner.web
	./prbsnflx scanner.c scanner.l++
	@rm -f scanner.c


.PHONY: clean

clean:
	rm -f out.mp sudoku.cxx sudoku$(EXEEXT) sudoku.o sudoku.1 fldtype.cxx fldtype.hxx fldtype.o \
              out.mp out.mpx sudoku.dvi sudoku.dvi sudoku.ps sudoku.pdf sudoku.log mpxerr.tex mpx*.dvi \
              cmdlnopt.cxx cmdlnopt.h cmdlnopt.hxx cmdlnopt.o prbsnflx.c++ scanner.c scanner1.h++ \
              out_samp.mpx 

.PHONY: run

# 2> ttemp.txt

run: sudoku$(EXEEXT) test_input.txt
	./sudoku$(EXEEXT) --pass-limit 50 --input-filename test_input.txt \
           --output-filename out.mp 


.PHONY: run-o

run-o: 
	mpost sudoku.mp
	tex sudoku.tex
	dvips -o sudoku.ps sudoku.dvi

out.mp: sudoku$(EXEEXT)
	./sudoku$(EXEEXT) 2>/dev/null > out.mp

sudoku.pdf: sudoku.ps
	ps2pdf sudoku.ps

sudoku.ps: sudoku.dvi
	dvips -o sudoku.ps sudoku.dvi

sudoku.dvi: sudoku.tex sudoku.1
	tex sudoku.tex

sudoku.1: sudoku.mp out.mp
	mpost sudoku.mp

.PHONY: run-t

run-t: 
	tex sudoku.tex
	dvips -o sudoku.ps sudoku.dvi

.PHONY: run-p

run-p: sudoku$(EXEEXT)
	./sudoku$(EXEEXT) $(PASS) 2> ttemp.txt


.PHONY: query

query: 
	echo "A == $A"



