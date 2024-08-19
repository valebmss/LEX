%{
#include <stdio.h>
#include <string.h>
%}

%option noyywrap
%option case-insensitive


%%
house        { printf("casa "); }
houses       { printf("casas "); }
dog          { printf("perro "); }
dogs         { printf("perros "); }
cat          { printf("gato "); }
cats         { printf("gatos "); }
car          { printf("coche "); }
cars         { printf("coches "); }
apple        { printf("manzana "); }
apples       { printf("manzanas "); }
child        { printf("niño "); }
children     { printf("niños "); }
woman        { printf("mujer "); }
women        { printf("mujeres "); }
man          { printf("hombre "); }
men          { printf("hombres "); }
hello        { printf("hola "); }
goodbye      { printf("adiós "); }
please       { printf("por favor "); }
love    { printf("amor "); }
[ \t\n]+     { printf("%s", yytext); } // Mantener los espacios, tabs y saltos de línea
.            { printf("%s", yytext); } // Cualquier otro carácter se imprime tal cual
%%

int main() {
    yylex();  // Llama al analizador léxico
    return 0;
}
