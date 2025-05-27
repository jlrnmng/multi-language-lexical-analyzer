// main.c (modified for file input)
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern void yy_scan_string(const char *str);
extern int current_lang;

enum Lang { LANG_C, LANG_PYTHON, LANG_JAVA };

void set_language(const char *lang) {
    if (strcmp(lang, "c") == 0) {
        current_lang = LANG_C;
        yy_scan_string("###LANG:C### ");
    } else if (strcmp(lang, "python") == 0) {
        current_lang = LANG_PYTHON;
        yy_scan_string("###LANG:PYTHON### ");
    } else if (strcmp(lang, "java") == 0) {
        current_lang = LANG_JAVA;
        yy_scan_string("###LANG:JAVA### ");
    } else {
        printf("Unsupported language. Use: c, python, java\n");
        exit(1);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <language> <source_file>\n", argv[0]);
        return 1;
    }

    set_language(argv[1]);

    FILE *fp = fopen(argv[2], "r");
    if (!fp) {
        perror("File open failed");
        return 1;
    }

    fseek(fp, 0, SEEK_END);
    long size = ftell(fp);
    fseek(fp, 0, SEEK_SET);

    char *buffer = malloc(size + 1);
    fread(buffer, 1, size, fp);
    buffer[size] = '\0';
    fclose(fp);

    yy_scan_string(buffer);
    yylex();
    free(buffer);
    return 0;
}
