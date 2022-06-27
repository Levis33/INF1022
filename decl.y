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
program:;

varlist:;

cmds:;

cmd:;

%%

int main(){

}