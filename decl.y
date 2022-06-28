%{
    /*
    Bruno Coutinho - 
    Thiago Levis Alambert Rorigues - 1812899

    */

    #include <stdlib.h>
    #include <stdio.h>
    #include <string.h>

int yylex();
void  yyerror(const char *s){
    fprintf(stderr, "%s\n", s);
};

%}

%union{
    char *str;
    int number;
};

%type <str> program varlist ret cmds cmd;
%token <str> ID;
%token <number> ENTRADA ;
%token <number> SAIDA;
%token <number> FACA;
%token <number> ENQUANTO;
%token <number> INC;
%token <number> ZERA;
%token <number> VEZES;
%token <number> SE;
%token <number> SENAO;
%token <number> FIM;
%token <number> NEWLINE;
%token <number> AP;
%token <number> FP;
%token <number> IGUAL;


%start program
%%
program: ENTRADA varlist SAIDA cmds FIM NEWLINE {
    printf("int codigoC(%s) {\n%s ", $2, $4);
    };

varlist: varlist ID{

    }
    
    | ID {
        $$ = $1;
    };
 
cmds: cmds cmd{

    }
    |cmd {
        $$ = $1;
    };

cmd: ENQUANTO ID FACA cmds FIM{
        char *result = malloc(strlen($2) + strlen($4) + 15);
        sprintf(result, "while(%s){\n\t%s}\n", $2, $4);
        $$ = result;

    }
    | ID IGUAL ID{
        char *result = malloc(strlen($1) + strlen($3) + 6);
        sprintf(result, "$s = %s;\n", $1, $3);
        $$ = result;

    }
    | INC AP ID FP{
        char *result = malloc(strlen($3) + 8);
        sprintf(result, "%s += 1;\n", $3);
        $$ = result; 

    }
    | ZERA AP ID FP{
        char *result = malloc(strlen($3) + 7);
        sprintf(result, "%s = 0;\n");
        $$ = result;

    }
    | SE ID cmds FIM{
        char *result = malloc(strlen($2) + strlen($3) + 12);
        sprintf(result, "if(%s){\n\t%s\n}", $2, $3);
        $$ = result;

    }
    | SE ID cmds SENAO cmds FIM{
        char *result = malloc(strlen($2) + strlen($3) + strlen($5) + 22);
        sprintf(result, "if(%s){\n\t%s\n}\nelse{\n$s}" , $2, $3, $4);
        $$ = result;
    }
    |
    FACA ID VEZES cmds FIM{
        char *result = malloc(strlen($2) + strlen($4) + 27);
        sprintf(result, "for(int i=0;i<%s;i++){\n\t%s\n}", $2, $4);
        $$ = result;
    }
    ;

%%

int main(){

    printf("#include <stdlib.h>\n#include <stdio.h>\n");

}