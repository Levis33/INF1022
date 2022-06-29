bison -d trabalho.y
flex trabalho.l
gcc -o provolone lex.yy.c trabalho.tab.c -ll
