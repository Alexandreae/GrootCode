%{
	#include <stdio.h>
	#include<stdlib.h>
	FILE* yyin;
    extern int linenumb;
%}

%union {
	char c;
	char *s;
	int d;
}

%token EQUAL BREAKLINE INIT
%token SEMICOLON SUM MINUS
%token POT MULTIPLY DIVIDE PAROPEN
%token PARCLOSE OPENBLOCK CLOSEBLOCK CMPREQUAL 
%token PRINT IF ELSE DO WHILE
%token LESSTHAN MORETHAN AND OR 
%token <d> INT 
%token <s> STR

%left SIM MINUS POT MULTIPLY DIVIDE
%left LESSTHAN MORETHAN 
%left OR AND CMPREQUAL
%right EQUAL 

%%

program:  
    | INIT command
    ;

command: PRINT relexp
    | IF par command
    | IF par command ELSE command
    | WHILE par command
    | DO command WHILE par
    | OPENBLOCK command CLOSEBLOCK
    | line
    ;

par: PAROPEN line PARCLOSE
    ;

line: str EQUAL line
    | relexp
    ;

relexp: relexp
    | exp LESSTHAN exp
    | exp MORETHAN exp
    | exp CMPREQUAL exp
    ;


exp: term
    | term SUM term
    | term MINUS term
    | term OR term
    ;

term: type
    | type POT type
    | type MULTIPLY type
    | type DIVIDE type
    | type AND type 
    ;

type: str
    | integer
    | bool
    ;

str: STR
    ;

integer: INT
    ;

bool: BOOl
    ;
%%

int main(int argc, char **argv){
	yyin=fopen(argv[1],"r");
	yyparse();
	fclose(yyin);
	return 0;
}

yyerror(char *s){
	fprintf(stderr, "ERROR in line %d\n", linenumb);
}