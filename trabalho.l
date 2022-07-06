%option yywrap

    /*
    Bruno Coutinho - 1910392
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
ELEVADO     return (ELEVADO);
"("         return (AP);
")"         return (FP);
"="         return (IGUAL);
"*"         return (MULTIPLICA);
"/"         return (DIVISAO);
[a-zA-Z]+	{ yylval.str=strdup(yytext); return (ID); }
