#include <string.h>
#include <stdio.h> 
#include <stdlib.h>
#include <time.h>

#ifndef _T_H_

#define _T_H_


//单词文件一行的最大长度，也是单词最大个数
#define MAXLINE 1000 

//文件格式 ”英文=中文 “ 
typedef struct
{
	char*english;
	char*chinese;
 }Word; 
 
 
int init();
void endtest(int size);
void test(int size);
char* dir();

#endif
