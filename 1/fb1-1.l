%{
/* Declaraciones de código C */
int num_words = 0;
int num_chars = 0;
int num_lines = 0;
%}
%%
[a-zA-Z]+    { num_words++; num_chars += yyleng; }
[0-9]+       { num_words++; num_chars += yyleng; } // Contar números como palabras
[ \t\r]+     { /* Ignorar espacios, tabs, y retornos de carro */ }
\n           { num_lines++; num_chars++; } // Contar nueva línea
.            { num_chars++; } // Contar cualquier otro carácter
%%
int main() {
    yylex(); // Llama al analizador léxico
    printf("FIN DE LA EJECUCION\n\n");
    printf("Palabras: %d\n", num_words);
    printf("Caracteres: %d\n", num_chars);
    printf("Líneas: %d\n", num_lines);
    return 0;
}
