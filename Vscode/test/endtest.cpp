
#include "t.h"

//声明全局变量 
extern Word word[];

//释放资源 
void endtest(int size)
{
	int i;
	
	for (i = 0;i<size;i++)
	{
		//释放内存，清空指针 
		free(word[i].english);
		word[i].english = NULL;
		
		free(word[i].chinese);
		word[i].chinese = NULL;
	}
 } 
