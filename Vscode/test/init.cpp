#include "t.h"


//����ȫ�ֱ��� 
extern Word word[];

//��ʾ���棬��ȡ���������ļ���struct���ݽṹ��
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

printf("\t��ӭʹ��Ӣ�ﵥ�ʱ�׼������ϵͳ��\n");
printf("========================================\n");
//printf("����������õĵ��ʿ��ļ�����");
//scanf("%s" ,fname);


p = dir(); 
p1 = strchr(p,'\n');
	if(p1!=NULL){
		*p1 = '\0';
	}
	
//����޷���	
if((fp = fopen(p,"r")) == NULL) 
{
	printf("���ܴ��ļ�%s�����飡" ,p);
	exit(0);	
}

fflush(stdin);

while(fgets(line,MAXLINE,fp))
{
	//���� 
	for(j = 0;j < strlen(line); j++){
		if(line[j] != '\n'){
			line[j] =line[j];
		}
	}
	
	//strchr(*str��val)����val��һ�γ��ֵ�λ�� 
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
