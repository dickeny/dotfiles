#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int step;
int len;
const char * in = "，。《》？；：·［］、！￥……×（）——";

int include(char c){
    int i;
    for(i = 0; i < len; i += step)
        if (c == in[i])
            return 1;
    return 0;
}

int zhcnt(const char* name){
    char c;
    int i, n = 0;
    FILE * fp = stdin;
    if (name[0] != 0 ) fp = fopen(name, "r");

    if (fp == NULL){
        fprintf(stderr, "No such file '%s'.\n", name);
        return 0;
    }

    while( (c = fgetc(fp)) != EOF){
        if ( c < 0 || c > 128){
            for (i = 1; i < step; i ++)
                fgetc(fp);
            if ( !include(c))
                n ++;
        }
    }
    return n;
}


int main(int argc, char * argv[]){
    int i;
    step = strlen("我");
    len = strlen(in);
    if (argc == 1)
        printf ("%d\n", zhcnt(""));
    else if (argc == 2)
        printf ("%d\n", zhcnt(argv[1]));
    else for(i = 1; i < argc; i ++)
        printf ("%s: %d\n", argv[i], zhcnt(argv[i]));
    return 0;
}
    
