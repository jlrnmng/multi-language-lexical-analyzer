lexer: lexer.l main.c
	flex -o lexer.c lexer.l
	gcc lexer.c main.c -o lexer -lfl

clean:
	rm -f lexer lexer.c
