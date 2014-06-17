@
@c
@=%{@>

#include <stdlib.h>
#include <stdio.h>

typedef void *yyscan_t;

#include "parser.h++"



@=%}@>

@q =%option header-file="scanner.h++"@>
@q =%option bison-bridge@>
@q =%option reentrant@>

@=%%@>


@=%{@>

@=%}@>


@=. {@>

   /* Do nothing  */

}


@=%%@>

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

