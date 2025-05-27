%{
#include <stdio.h>
#include <string.h>

enum Lang { LANG_C, LANG_PYTHON, LANG_JAVA };
int current_lang;
%}

%%

"###LANG:C###"        { current_lang = LANG_C; }
"###LANG:PYTHON###"   { current_lang = LANG_PYTHON; }
"###LANG:JAVA###"     { current_lang = LANG_JAVA; }

[ \t\n]+              ; // ignore whitespace

"int"                 { if (current_lang == LANG_C) printf("C KEYWORD: int\n"); else ECHO; }
"float"               { if (current_lang == LANG_C) printf("C KEYWORD: float\n"); else ECHO; }

"def"                 { if (current_lang == LANG_PYTHON) printf("PYTHON KEYWORD: def\n"); else ECHO; }
"class"               {
                        if (current_lang == LANG_PYTHON) printf("PYTHON KEYWORD: class\n");
                        else if (current_lang == LANG_JAVA) printf("JAVA KEYWORD: class\n");
                        else ECHO;
                      }

"public"              { if (current_lang == LANG_JAVA) printf("JAVA KEYWORD: public\n"); else ECHO; }

\"[^\"]*\"            {
                        if (current_lang == LANG_C) printf("C STRING: %s\n", yytext);
                        else if (current_lang == LANG_PYTHON) printf("PYTHON STRING: %s\n", yytext);
                        else if (current_lang == LANG_JAVA) printf("JAVA STRING: %s\n", yytext);
                      }

\'[^\']*\'            {
                        if (current_lang == LANG_C) printf("C STRING: %s\n", yytext);
                        else if (current_lang == LANG_PYTHON) printf("PYTHON STRING: %s\n", yytext);
                        else if (current_lang == LANG_JAVA) printf("JAVA STRING: %s\n", yytext);
                      }

[a-zA-Z_][a-zA-Z0-9_]* {
                        if (current_lang == LANG_C) printf("C IDENTIFIER: %s\n", yytext);
                        else if (current_lang == LANG_PYTHON) printf("PYTHON IDENTIFIER: %s\n", yytext);
                        else if (current_lang == LANG_JAVA) printf("JAVA IDENTIFIER: %s\n", yytext);
                      }

[0-9]+                {
                        if (current_lang == LANG_C) printf("C NUMBER: %s\n", yytext);
                        else if (current_lang == LANG_PYTHON) printf("PYTHON NUMBER: %s\n", yytext);
                        else if (current_lang == LANG_JAVA) printf("JAVA NUMBER: %s\n", yytext);
                      }

.                     {
                        if (current_lang == LANG_C) printf("C SYMBOL: %s\n", yytext);
                        else if (current_lang == LANG_PYTHON) printf("PYTHON SYMBOL: %s\n", yytext);
                        else if (current_lang == LANG_JAVA) printf("JAVA SYMBOL: %s\n", yytext);
                      }

%%

int yywrap() {
    return 1;
}
