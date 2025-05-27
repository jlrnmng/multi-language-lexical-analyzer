%%
"int"           { printf("C KEYWORD: int\n"); }
"float"         { printf("C KEYWORD: float\n"); }
[a-zA-Z_][a-zA-Z0-9_]*   { printf("C IDENTIFIER: %s\n", yytext); }
[0-9]+          { printf("C NUMBER: %s\n", yytext); }
[ \t\n]+        ; // ignore whitespace
.               { printf("C SYMBOL: %s\n", yytext); }
