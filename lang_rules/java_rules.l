%%
"public"        { printf("JAVA KEYWORD: public\n"); }
"class"         { printf("JAVA KEYWORD: class\n"); }
[a-zA-Z_][a-zA-Z0-9_]*   { printf("JAVA IDENTIFIER: %s\n", yytext); }
[0-9]+          { printf("JAVA NUMBER: %s\n", yytext); }
[ \t\n]+        ; // ignore whitespace
.               { printf("JAVA SYMBOL: %s\n", yytext); }
