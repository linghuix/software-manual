#include "t.h"


 //�����Ѿ����Թ����ļ������ƺ�Ŀ¼.����ָ���ļ���ָ�� 
 char* dir(){
 	FILE *fp;
	char fname[10][MAXLINE];
	char name[MAXLINE];
	int i = 0;
	int choice;
	int j;

if((fp = fopen( "dir.txt" ,"r")) == NULL) 
{
	printf("���ܴ��ļ�dir.txt�����飡" );
	exit(0);	
}
 
fflush(stdin);

printf("�Ѵ򿪹��ĵ��ʱ�\n" );

while(fgets(fname[i],MAXLINE,fp))
{
	
	printf("%d. %s" ,i+1,fname[i]);
	i++;
 }
 
 //ʹ��fgets��ȡ���ļ����лس������������һ��û�лس�����Ҫ���� 
 printf("\n");
 printf("0�������µ��ʱ� ��1�������������ʱ�\n" );
 scanf("%d" ,&choice);
 
 if(choice){
 	printf("���������ʱ�\n" );
 	scanf("%d" ,&j);
 	return fname[j-1];
 }
 else{
 	//fflush(stdin);
 	printf("����������õĵ��ʿ��ļ�����");
 	scanf("%s" ,name);
 	//������ļ������û�лس� 
 	
 	if((fp = fopen( "dir.txt" ,"a")) == NULL) 
{
	printf("���ܴ��ļ�dir.txt�����飡" );
	exit(0);	
}
	//�����һ��׷��������Ҫ�Ȼ��� 
	fputs("\n" ,fp);
 	fputs(name,fp);
 	
 	fclose(fp);
 	fp = NULL;
 	
 	return name;
 } 
}
