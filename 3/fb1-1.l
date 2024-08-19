%{
#include <stdio.h>
%}

%%

[0-9]+(\.[0-9]*)? { printf("NUMERO: %s\n", yytext); }
[-+*/] { printf("OPERADOR: %c\n", yytext[0]); }
"(" { printf("PARÉNTESIS ABIERTO: %s\n", yytext); }
")" { printf("PARÉNTESIS CERRADO: %s\n", yytext); }
. { printf("CARACTER ESPECIAL: %s\n", yytext); }

%%
