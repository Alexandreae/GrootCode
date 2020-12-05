project: GrootCodeFlex.l GrootCodeBison.y
	bison -d GrootCodeBison.y
	flex GrootCodeFlex.l
	gcc -o GrootCodeTeste GrootCodeBison.tab.c lex.yy.c -lfl
clean:
	rm GrootCodeBison.tab.c lex.yy.c GrootCodeBison.tab.h GrootCodeTester