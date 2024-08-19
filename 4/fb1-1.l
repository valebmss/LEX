%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

void print_token(const char *token_name, const char *value) {
    printf("Token: %-4s Value: %s\n", token_name, value);
}

%}

%option noyywrap

%%

[0-9]+(\.[0-9]*)?          { print_token("NUMBER", yytext); }
\+                         { print_token("ADD", yytext); }
\-                         { print_token("SUB", yytext); }
\*                         { print_token("MUL", yytext); }
\/                         { print_token("DIV", yytext); }
abs                         { print_token("ABS", yytext); }
\n                         { print_token("EOL", yytext); }
[ \t]+                     { /* Ignorar espacios en blanco */ }
.                          { printf("No se reconoce: %s\n", yytext); }

%%

int main() {
    yylex();  // Llama al analizador léxico
    return 0;
}
