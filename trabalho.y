%{

    /*
    Bruno Coutinho - 1910392
    Thiago Levis Alamber Rodrigues - 1812899
    */

	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>

	int yylex();
	extern FILE *yyin;
	void yyerror(const char *s){
            fprintf(stderr, "%s\n", s);
    };
%}

%union{
	char *str;
}

%type <str> cmd cmds varlist
%token ENTRADA
%token SAIDA
%token FIM
%token ENQUANTO
%token FACA
%token VEZES
%token INC
%token ZERA
%token SE
%token ENTAO
%token SENAO
%token AP
%token FP
%token IGUAL
%token MULTIPLICA
%token DIVISAO
%token ELEVADO
%token <str> ID



%%
program	: ENTRADA varlist SAIDA varlist cmds FIM {
    FILE *f = fopen("saida.c", "w");
    if (f == NULL){
        exit(1);
    } 

    char *result = malloc(strlen($2) + strlen($4) + strlen($5) + 58);
    sprintf(result, "#include <math.h>\nint saida(int %s){\nint %s;\n%s\nreturn %s;\n}", $2, $4, $5, $4);
    fprintf(f, "%s", result);
    fclose(f);

    printf("codigo executado com sucesso, verifique o saida.c\n");

    exit(0);
};

varlist	: varlist ID {

    char *result = malloc(strlen($1) + strlen($2) + 6);
    sprintf(result, "%s, int %s", $1, $2);
    $$ = result;
  }
  | ID {
		$$ = $1;
	}
    ;



cmds : cmd cmds {
    char *result = malloc(strlen($1) + strlen($2) + 1);
    sprintf(result, "%s %s", $1, $2);
    $$ = result;
  }
  | cmd {
        $$ = $1;
    }
    ;

cmd : INC AP ID FP {
        char * result = malloc(strlen($3) + 8);
        sprintf(result, "%s += 1;\n", $3);
        $$ = result;
	}
    | ID IGUAL ID {
        char *result =malloc(strlen($1) + strlen($3) + 6);
        sprintf(result, "%s = %s;\n", $1, $3); 
		$$ = result;
	}
    | ZERA AP ID FP { 
        char *result=malloc(strlen($3) + 7);
        sprintf(result, "%s = 0;\n", $3);
		$$ = result; 
	}
    | ID MULTIPLICA ID{
        char * result = malloc(strlen($1) + strlen($3) + 5);
        sprintf(result, "%s=%s*%s;\n", $1, $1, $3);
        $$ = result;
    }
    | ID DIVISAO ID{
        char * result = malloc(strlen($1) + strlen($3) + 5);
        sprintf(result, "%s=%s/%s;\n", $1, $1, $3);
        $$ = result;
    }
    | ID ELEVADO ID{
        char * result = malloc(strlen($3) + strlen($1) + 11);
        sprintf(result, "%s=pow(%s,%s);\n", $1, $1, $3);
        $$ = result;
    }
    | SE ID ENTAO cmds FIM{
        char *result = malloc(strlen($2) + strlen($4) + 9);
        sprintf(result, "if(%s){\n\t%s}", $2, $4);
        $$ = result;
    } 
    | SE ID ENTAO cmds SENAO cmds FIM{
        char *result = malloc(strlen($2) + strlen($4) + strlen($6) + 21);
        sprintf(result, "if(%s){\n\t%s}\nelse{\n\t%s}", $2, $4, $6);
        $$ = result;
    } 
    | FACA ID VEZES cmds FIM{
        char *result = malloc(strlen($2) + strlen($4) + 23);
        sprintf(result, "for(int i=0;i<%s;i++){\n\t%s}", $2, $4);
        $$ = result;
    }
    | ENQUANTO ID FACA cmds FIM {
    char *result = malloc(strlen($2) + strlen($4) + 16);
    sprintf(result,"while(%s){\n%s}\n", $2, $4);
    $$ = result;

    }
    ;

%%

int main(int argc, char** argv){
	
    yyin = fopen(argv[1], "r");
    yyparse();
    fclose(yyin);
	return 0;
}
