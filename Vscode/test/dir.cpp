#include "t.h"


 //保存已经测试过的文件的名称和目录.返回指向文件名指针 
 char* dir(){
 	FILE *fp;
	char fname[10][MAXLINE];
	char name[MAXLINE];
	int i = 0;
	int choice;
	int j;

if((fp = fopen( "dir.txt" ,"r")) == NULL) 
{
	printf("不能打开文件dir.txt，请检查！" );
	exit(0);	
}
 
fflush(stdin);

printf("已打开过的单词表：\n" );

while(fgets(fname[i],MAXLINE,fp))
{
	
	printf("%d. %s" ,i+1,fname[i]);
	i++;
 }
 
 //使用fgets读取的文件行有回车符，但是最后一行没有回车，需要调整 
 printf("\n");
 printf("0——打开新单词表 ，1——打开上述单词表\n" );
 scanf("%d" ,&choice);
 
 if(choice){
 	printf("打开上述单词表：\n" );
 	scanf("%d" ,&j);
 	return fname[j-1];
 }
 else{
 	//fflush(stdin);
 	printf("请输入测试用的单词库文件名：");
 	scanf("%s" ,name);
 	//读入的文件名最后没有回车 
 	
 	if((fp = fopen( "dir.txt" ,"a")) == NULL) 
{
	printf("不能打开文件dir.txt，请检查！" );
	exit(0);	
}
	//在最后一行追加文字需要先换行 
	fputs("\n" ,fp);
 	fputs(name,fp);
 	
 	fclose(fp);
 	fp = NULL;
 	
 	return name;
 } 
}
