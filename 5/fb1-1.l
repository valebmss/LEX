%{
#include <stdio.h>
#include <math.h>

void classify_number(double real, double imag, int is_polar) {
    if (is_polar) {
        if (imag == 0) {
            printf("Número real en forma polar: %f\n", real);
        } else if (real == 0) {
            printf("Número imaginario en forma polar: %fi\n", imag);
        } else {
            printf("Número complejo en forma polar: %f∠%f\n", real, imag);
        }
    } else {
        if (imag == 0) {
            printf("Número real: %f\n", real);
        } else if (real == 0) {
            printf("Número imaginario: %fi\n", imag);
        } else {
            printf("Número complejo: %f + %fi\n", real, imag);
        }
    }
}

%}

%option noyywrap

real    [-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?
imag    [-+]?[0-9]*\.?[0-9]*[i]
polar   [-+]?[0-9]*\.?[0-9]+∠([-+]?[0-9]*\.?[0-9]+[°π]?)|([-+]?[0-9]*\.?[0-9]+[/][-+]?[0-9]*\.?[0-9]+)

%%

{real}\+{real}[i]?      { 
                            double real_part, imag_part;
                            sscanf(yytext, "%lf+%lfi", &real_part, &imag_part);
                            classify_number(real_part, imag_part, 0);
                        }
{real}\-{real}[i]?      { 
                            double real_part, imag_part;
                            sscanf(yytext, "%lf-%lfi", &real_part, &imag_part);
                            classify_number(real_part, -imag_part, 0);
                        }
{real}[i]               { 
                            double imag_part;
                            sscanf(yytext, "%lfi", &imag_part);
                            classify_number(0, imag_part, 0);
                        }
{real}                  { 
                            double real_part;
                            sscanf(yytext, "%lf", &real_part);
                            classify_number(real_part, 0, 0);
                        }
{polar}                { 
                            double magnitude, angle;
                            if (sscanf(yytext, "%lf∠%lf°", &magnitude, &angle) == 2) {
                                classify_number(magnitude, angle * M_PI / 180.0, 1);
                            } else if (sscanf(yytext, "%lf∠π/%lf", &magnitude, &angle) == 2) {
                                classify_number(magnitude, M_PI / angle, 1);
                            } else if (sscanf(yytext, "%lf∠%lfπ", &magnitude, &angle) == 2) {
                                classify_number(magnitude, angle * M_PI, 1);
                            }
                        }

.                       { printf("No se reconoce: %s\n", yytext); }

%%

int main() {
    yylex();  // Llama al analizador léxico
    return 0;
}


