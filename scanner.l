%option yywrap

    /*
    Bruno Coutinho - 
    Thiago Levis Alambert Rorigues - 1812899

    */

    #include <stdio.h>
    #include "y.tab.h"

%%

ENTRADA     return (ENTRADA);
SAIDA       return (SAIDA);
FACA        return (FACA);
ENQUANTO    return (ENQUANTO);
INC         return (INC);
ZERA        return (ZERA);
VEZES       return (VEZES);
SE          return (SE);
SENAO       return (SENAO);
FIM         return (FIM);
\n          return (NEWLINE);
"("         return (AP);
")"         return (FP);
"="         return (IGUAL);
[a-zA-Z]    return {yylval.sval = strdup(yytext); return (ID);}