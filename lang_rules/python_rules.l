%%
"def"           { printf("PYTHON KEYWORD: def\n"); }
"class"         { printf("PYTHON KEYWORD: class\n"); }
[a-zA-Z_][a-zA-Z0-9_]*   { printf("PYTHON IDENTIFIER: %s\n", yytext); }
[0-9]+          { printf("PYTHON NUMBER: %s\n", yytext); }
[ \t\n]+        ; // ignore whitespace
.               { printf("PYTHON SYMBOL: %s\n", yytext); }
