#include <string.h>
#include <stdio.h> 
#include <stdlib.h>
#include <time.h>

#ifndef _T_H_

#define _T_H_


//�����ļ�һ�е���󳤶ȣ�Ҳ�ǵ���������
#define MAXLINE 1000 

//�ļ���ʽ ��Ӣ��=���� �� 
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
