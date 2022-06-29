%option yywrap

    /*

    Bruno Coutinho -
    Thiago Levis Alamber Rodrigues - 1812899

    */

    #include <stdio.h>
    #include "trabalho.tab.h"
%%

ENTRADA		return (ENTRADA);
SAIDA	    return (SAIDA);
FIM         return (FIM);
ENQUANTO    return (ENQUANTO);
FACA       	return (FACA);
VEZES       return (VEZES);
INC         return (INC);
ZERA        return (ZERA);
SE          return (SE);
ENTAO       return (ENTAO);
SENAO       return (SENAO);
"("         return (AP);
")"         return (FP);
"="         return (IGUAL);
[a-zA-Z]+	{ yylval.num=strdup(yytext); return (ID); }
