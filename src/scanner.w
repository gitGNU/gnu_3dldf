@q scanner.w @> 
@q Created by Laurence Finston Tue Jun 17 14:00:36 2014 +0200  @>
     
@q * Copyright and License.@>

@q This file is part of GNU 3DLDF, a package for three-dimensional drawing. @>
@q Copyright (C) 2014 The Free Software Foundation                          @>

@q GNU 3DLDF is free software; you can redistribute it and/or modify        @>
@q it under the terms of the GNU General Public License as published by     @>
@q the Free Software Foundation; either version 3 of the License, or        @>
@q (at your option) any later version.                                      @>

@q GNU 3DLDF is distributed in the hope that it will be useful, @>
@q but WITHOUT ANY WARRANTY; without even the implied warranty of @>
@q MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the @>
@q GNU General Public License for more details. @>

@q You should have received a copy of the GNU General Public License @>
@q along with GNU 3DLDF; if not, write to the Free Software @>
@q Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA @>

@q GNU 3DLDF is a GNU package.  @>
@q It is part of the GNU Project of the  @>
@q Free Software Foundation @>
@q and is published under the GNU General Public License. @>
@q See the website http://www.gnu.org @>
@q for more information.   @>
@q GNU 3DLDF is available for downloading from @>
@q http://www.gnu.org/software/3dldf/LDF.html. @>

@q (``@@'' stands for a single at-sign in the following paragraph.) @>

@q Please send bug reports to Laurence.Finston@@gmx.de @>
@q The mailing list help-3dldf@@gnu.org is available for people to @>
@q ask other users for help.  @>
@q The mailing list info-3dldf@@gnu.org is for sending @>
@q announcements to users. To subscribe to these mailing lists, send an @>
@q email with ``subscribe <email-address>'' as the subject.  @>

@q The author can be contacted at: @>

@q Laurence D. Finston                 @> 
@q c/o Free Software Foundation, Inc.  @>
@q 51 Franklin St, Fifth Floor         @> 
@q Boston, MA  02110-1301              @>
@q USA                                 @>

@q Laurence.Finston@@gmx.de (@@ stands for a single ``at'' sign.)@>



@q * (0) Scanner (|yylex|).  @>

@ Scanner (|yylex|).  
\initials{LDF 2014.06.17.}

\LOG
\initials{LDF 2014.06.17.}
Added this file.
\ENDLOG

@q * (1) Rules.  @>
@  Rules.

@q ** (2) END.  @>
@ END.
\initials{LDF 2014.06.17.}

\LOG
\initials{LDF 2014.06.17.}
Added this rule.
\ENDLOG

@<Rules@>=

@=end|END {@>

   cerr << "END.  Returning END_YY." << endl;

   return END_YY;

}

@q ** (2) Comment.  @>
@ Comment.
\initials{LDF 2014.06.17.}

\LOG
\initials{LDF 2014.06.17.}
Added this rule.
\ENDLOG

@<Rules@>=

@=#.*$ {@>

   cerr << "Comment:  `yytext' ==" << endl 
        << yytext
        << endl;

   /* Ignore.  */
}

@q ** (2) @>
@
@<Rules@>=

@=. {@>

   printf("Unknown string:  yytext == %s\n", yytext);

   /* Do nothing  */

}


@q * (1) Putting scanner together.  @>
@ Putting scanner together.  
\initials{LDF 2014.06.17.}


@c
@=%{@>

#include <stdlib.h>
#include <stdio.h>

#include <fstream>
#include <iomanip>
#include <ios>
#include <iostream>
#include <iterator>
#include <sstream>   
#include <string> 

using namespace std;

typedef void *yyscan_t;

#include "parser.h++"


@=%}@>

@q %option header-file="scanner.h++" @>
@q =%option bison-bridge@>
@q =%option reentrant@>

@=%%@>


@=%{@>

@=%}@>

@<Rules@>@;@/

@=%%@>

#if 0 
int
yywrap(yyscan_t parameter)
{

   return 1;

}

int
yyerror(void *v, char const *s)
{

   return 0;

}




#else
int
yywrap(void)
{

   return 1;

}

int
yyerror(char const *s)
{

   return 0;

}



#endif 

