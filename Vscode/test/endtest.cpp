
#include "t.h"

//����ȫ�ֱ��� 
extern Word word[];

//�ͷ���Դ 
void endtest(int size)
{
	int i;
	
	for (i = 0;i<size;i++)
	{
		//�ͷ��ڴ棬���ָ�� 
		free(word[i].english);
		word[i].english = NULL;
		
		free(word[i].chinese);
		word[i].chinese = NULL;
	}
 } 
