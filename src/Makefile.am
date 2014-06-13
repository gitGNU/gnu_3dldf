#### 3DLDF-3.0.1/src/Makefile.am
#### Created by Laurence D. Finston (LDF).

#### * Copyright and License.

#### This file is part of GNU 3DLDF, a package for three-dimensional drawing. 
#### Copyright (C) 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013 The Free Software Foundation

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

#### Please send bug reports to Laurence.Finston@@gmx.de
#### The mailing list help-3dldf@gnu.org is available for people to 
#### ask other users for help.  
#### The mailing list info-3dldf@gnu.org is for sending 
#### announcements to users. To subscribe to these mailing lists, send an 
#### email with "subscribe <email-address>" as the subject.  

#### The author can be contacted at: 

#### Laurence D. Finston 
#### c/o Free Software Foundation, Inc. 
#### 51 Franklin St, Fifth Floor 
#### Boston, MA  02110-1301  
#### USA

#### Laurence.Finston@gmx.de 



## * Top.

# ** Variables.

#### Automatic Variables.  For more, see Section 10.5.3, "Automatic Variables"
#### of the Make info manual.
#### LDF 2009.12.29.

#### $@:  Target
#### $<:  First prerequisite
#### $^:  The names of all the prerequisites, with spaces between them.
#### $*:  The stem with which an implicit rule matches

## * (1) Top.

# ** (2) Variables.

bin_PROGRAMS = dummy$(EXEEXT) prbsnflx$(EXEEXT) 3dldf$(EXEEXT)

dummy_SOURCES = dummy.cxx

lib_LTLIBRARIES = lib3dldflb.la 

3dldflb_CWEB_files = cmdlnopt.web glblcnst.web transfor.web utility.web

3dldflb_c_files = $(3dldflb_CWEB_files:.web=.c)
3dldflb_cpp_files = $(3dldflb_CWEB_files:.web=.c++) 
3dldflb_h_files = $(3dldflb_CWEB_files:.web=.h) 
3dldflb_hpp_files = $(3dldflb_CWEB_files:.web=.h++) 
3dldflb_lo_files = $(3dldflb_CWEB_files:.web=.lo)
3dldflb_obj_files = $(3dldflb_CWEB_files:.web=.o)

3dldf_SOURCES = glblvrbl.web main.web 

3dldf_cpp_files = $(3dldf_SOURCES:.web=.c++)
3dldf_c_files = $(3dldf_SOURCES:.web=.c)
3dldf_hpp_files = $(3dldf_SOURCES:.web=.h++) 
3dldf_h_files = $(3dldf_SOURCES:.web=.h)
3dldf_rpo_files = $(3dldf_SOURCES:.web=.rpo)
3dldf_obj_files = $(3dldf_SOURCES:.web=.o) 

3dldf_LDADD = lib3dldflb.la

#### AM_CPPFLAGS = -O0 ## This does not work, since '-02' is added
####                   ## to 'CXXCOMPILE'
####                   ## after the value of 'AM_CPPFLAGS'
####                   ## LDF 2014.06.12.

AM_LDFLAGS = -pthread

lib3dldflb.c:
	touch $@

dist-hook:
	rm ./lib3dldflb.c 


# 3dldf$(EXEEXT) 

# lib3dldfsp.la

#lib_LTLIBRARIES = lib3dldflb.la 

#### The following implicit (pattern) rule generates C++ source code and header files 
#### from the '.web' files.
#### This rule calls 'ctangle' and then compares the resulting '.c' and '.h' files
#### with the existing '.c++' and '.h++' files (if present).  Changes only
#### affecting whitespace, comments, and or "#line" directives are ignored.
#### If the '.c' file is otherwise identical to the '.c++' file, nothing further is
#### done with it and the '.c++' file remains unchanged.  
#### The same applies to the '.h' and '.h++' file.  
#### In addition, if the '.c' file has changed, the '.o' files is "touched" to 
#### update its timestamp, so that the '.web' file won't be tested again unless
#### it is changed.  However, it does seem that some unnecessary testing is performed.
####
#### If, however, a change is recognized, the '.c' file is renamed to '.c++'
#### and the '.h' file is renamed to '.h++'.
####
#### Please note that this "algorithm" has the unfortunate consequence
#### that changes to whitespace within strings are also ignored.  In this case, 
#### the corresponding '.o' file must be deleted or
#### some other change must be made to the '.web' file in order to force recompilation.
####
#### LDF 2013.04.11.

%.c++ %.h++ : %.web
	ctangle $<
	@if test -e $*.c++; \
        then \
        echo "$*.c++ exists"; \
        diff -q -w -B -I '^[[:space:]]*\(#line\|/\*\)' \
        $*.c++ $*.c > diff_c.res; \
           if test -s diff_c.res; \
           then \
              echo "$*.c++ has changed."; \
              mv $*.c $*.c++; \
           else \
              echo "$*.c++ is unchanged."; \
              rm $*.c; \
	      if test -s $*.o; \
	         then \
	         touch $*.o; \
	      fi; \
           fi; \
        else \
        echo "$*.c++ does not exist"; \
        mv $*.c $*.c++; \
        fi; 
####
	@if test -e $*.h++; \
        then \
        echo "$*.h++ exists"; \
        diff -q -w -B -I '^[[:space:]]*\(#line\|/\*\)' \
        $*.h++ $*.h > diff_h.res; \
           if test -s diff_h.res; \
           then \
              echo "$*.h++ has changed."; \
              mv $*.h $*.h++; \
           else \
              echo "$*.h++ is unchanged."; \
              rm $*.h; \
           fi; \
        else \
        echo "$*.h++ does not exist"; \
        if test -e $*.h; then \
        mv $*.h $*.h++; fi; \
        fi; 
	@rm -f diff_c.res diff_h.res 

#### ** (2) Implicit rule for compiling C++ files. 
####        LDF 2014.06.12.

%.o %.lo: %.c++
	libtool --mode=compile $(CXXCOMPILE) -O0 -c -o $@ $<

#### *** (3) prbsnflx

## 'prbsnflx' is a trivial Flex program that removes the '#line'
## preprocessor commands and the comments that 'ctangle' writes to
## 'parser.c'.  
## LDF 2004.03.26.

prbsnflx$(EXEEXT): prbsnflx.c++ 
	$(CXXCOMPILE) -o $@ $<

prbsnflx.c++: prbsnflx.l++
	flex -o $@ $<
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat prbsnflx.c++ >> AAAtmp.txt
	@mv AAAtmp.txt prbsnflx.c++

#### cmdlnopt.web

cmdlnopt.o: cmdlnopt.c++ cmdlnopt.h++ glblcnst.h++ glblvrbl.h++ utility.h++

#### glblcnst.web

glblcnst.o: glblcnst.c++ glblcnst.h++ 

#### glblvrbl.web

glblvrbl.o: glblvrbl.c++ glblvrbl.h++ glblcnst.h++

#### main.web

main.o: main.c++ main.h++ cmdlnopt.h++ glblcnst.h++ glblvrbl.h++ transfor.h++ utility.h++

#### transfor.web

transfor.o: transfor.c++ transfor.h++ glblcnst.h++ glblvrbl.h++

#### utility.web

utility.o: utility.c++ utility.h++ glblcnst.h++ glblvrbl.h++
	$(CXXCOMPILE) -o $@ -O0 -c $<


lib3dldflb.la: $(3dldflb_hpp_files) $(3dldf_hpp_files) $(3dldflb_lo_files) 
	$(CXXLINK) -rpath $(libdir) $(3dldflb_lo_files) $(LIBS)

#### Link 3dldf

3dldf$(EXEEXT): $(3dldf_obj_files) $(3dldf_LDADD) 
	@echo "Linking 3dldf"
	$(CXXLINK) $(3dldf_obj_files) $(3dldf_LDADD) $(LIBS)



#### * (1) prog

.PHONY: prog

prog: 3dldf$(EXEEXT)

#### * (1) run

.PHONY: run

run: 3dldf$(EXEEXT)
	3dldf$(EXEEXT)

#### * (1) purge

.PHONY: purge

purge: clean
	rm -f glblcnst.c glblcnst.h glblcnst.c++ glblcnst.h++ glblcnst.o \
              glblvrbl.c glblvrbl.h glblvrbl.c++ glblvrbl.h++ glblvrbl.o \
              transfor.c transfor.h transfor.c++ transfor.h++ transfor.o \
              utility.c utility.h utility.c++ utility.h++ utility.o \
              main.c main.h main.c++ main.h++ main.o \
              3dldf$(EXEEXT)


#### * (1) query

.PHONY: query

query:
	@echo "CXXCOMPILE  == $(CXXCOMPILE)"
	@echo "CXXLINK     == $(CXXLINK)"
	@echo "LIBS        == $(LIBS)"
	@echo "3dldf_LDADD == $(3dldf_LDADD)"

# @echo "3dldflb_c_files == $(3dldflb_c_files)"
# @echo "3dldflb_cpp_files == $(3dldflb_cpp_files)"
# @echo "CLEANFILES == $(CLEANFILES)"

# 
# @echo "CXX == $(CXX)"
# @echo "CXXLINK == $(CXXLINK)"
# @echo "CXXFLAGS == $(CXXFLAGS)"

## Local Variables:
## mode:Makefile
## outline-minor-mode:t
## outline-regexp:"## *\\*+"
## abbrev-mode:t
## eval:(font-lock-mode -1)
## End:
