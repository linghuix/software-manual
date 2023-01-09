#include "t.h"


//声明全局变量 
extern Word word[];

//显示界面，读取整个单词文件到struct数据结构中
int init()
{
 
FILE *fp;
char fname[50];
char line[MAXLINE];
char *p,*p1;
char *word1;
char *word2;
int i = 0;
int j;
int len;

printf("\t欢迎使用英语单词标准化测试系统！\n");
printf("========================================\n");
//printf("请输入测试用的单词库文件名：");
//scanf("%s" ,fname);


p = dir(); 
p1 = strchr(p,'\n');
	if(p1!=NULL){
		*p1 = '\0';
	}
	
//如果无法打开	
if((fp = fopen(p,"r")) == NULL) 
{
	printf("不能打开文件%s，请检查！" ,p);
	exit(0);	
}

fflush(stdin);

while(fgets(line,MAXLINE,fp))
{
	//加密 
	for(j = 0;j < strlen(line); j++){
		if(line[j] != '\n'){
			line[j] =line[j];
		}
	}
	
	//strchr(*str，val)返回val第一次出现的位置 
	p = strchr(line,'\n');
	if(p!=NULL){
		*p = '\0';
	} 
	
	p = strchr(line,'=');

	
	
	if(p!=NULL)
	{
		word1 = line;
		word2 = p;
		*p = '\0';
	
		++word2; 
		
		len = strlen(word1);
		word[i].english = (char*)malloc(len+1);
		strcpy(word[i].english, word1);
		
		len = strlen(word2);
		word[i].chinese = (char*)malloc(len+1);
		strcpy(word[i].chinese ,word2);
		
		i++;
	}
}

fclose(fp);
return i; 

}
