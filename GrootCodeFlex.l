%option noyywrap

%{
	#include <string.h>
	#include<stdlib.h>
	#include<stdio.h>
	#include "GrootCodeBison.tab.h"
	int linenumb=1;
%}

%%
[ \t]   	{                   }
\n		    { return BREAKLINE; }
"+"		    { return SUM; }
"-"		    { return MINUS; }
"*"		    { return MULTIPLY; }
"/"		    { return DIVIDE; }
"("		    { return PAROPEN; }
")"		    { return PARCLOSE; }
"=="        { return CMPREQUAL; }
"="         { return EQUAL; }
"GROOT:"    { return PRINT; }
"GROOT?"        { return IF; }
"NOT_GROOT"     { return ELSE; }
"NOT_GROOT?"    { return ELSEIF; }
"GROOT?!"       { return WHILE; }
"<"         { return LESSTHAN; }
">"         { return MORETHAN; }
"&&"        { return AND; }
"||"       { return OR; }
"I_AM_GROOT"	{ return FUNCTION_DEF; }
[0-9]+	    {yylval.d = atoi(yytext); return INT; }
[a-z]+      { yylval.s = strtok(yytext,":");return STR; }
%%