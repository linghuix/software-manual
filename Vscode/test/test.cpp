#include "t.h"

//����ȫ�ֱ��� 
extern Word word[];


//���Ե��ʵ�������� 
void test(int size){
	int i,j,t;//
	int flag;//�ж��Ƿ����ظ��ĸ���ѡ�0�ޣ�1�� 
	char choice;//�û���������Ĵ𰸣�ABCD�� 
	int xm[4];//ÿ��ѡ���Ӧ�ĵ����������е��±� 
	int count = 0;//����4����ͬ����Ŀѡ�� 
	int score = 0;//���Ե÷�
	int testType = 0; 
	
	printf("������ѡ����Ե�����(1-������Ӣ�� 0-Ӣ��������)��");
	scanf("%d",&testType);
	fflush(stdin);
	
	//ֻ�ܰ�˳�������Ŀ 
	for(i = 0;i<size;i++){
		system("cls");//������������������
		if(!testType){
			printf("%d./%d\nӢ�ģ�%s	�����ĺ���Ϊ��\n\n",i+1,size,word[i].english);
			
		} 
		
		else{
			printf("%d./%d\n���ģ�%s	��Ӧ��Ӣ��Ϊ��\n\n",i+1,size,word[i].chinese);
		}
	 
	
	//��������ĸ�ѡ��
	srand(time(NULL)) ;
	count = 0;
	while(count <= 4){
		t = rand()%size;
		
		if(t == i){
			continue;//�������ȷ��һ�������� 
		}
		
		flag = 0;
		
		//���ѡ��֮ǰ�Ѿ����ˣ�flag=1 
		for(j = 0;j<count;j++){
			if(xm[j] == t){
				flag = 1;
			}		
		}
		
		if(!flag){
			xm[count] = t;
			count++;
		}
		
		 
	}
	
	//���ֻҪ����ȷ��ѡ��������� 
	t = rand()%4;
	xm[t] = i;
	
	//�����������ĸ�ѡ��
	if(!testType){
			printf("\tA.%s\n",word[xm[0]].chinese);
			printf("\tB.%s\n",word[xm[1]].chinese);
			printf("\tC.%s\n",word[xm[2]].chinese);
			printf("\tD.%s\n",word[xm[3]].chinese);
			printf("\n\n");
			
		} 
		
	else{
			printf("\tA.%s\n",word[xm[0]].english);
			printf("\tB.%s\n",word[xm[1]].english);
			printf("\tC.%s\n",word[xm[2]].english);
			printf("\tD.%s\n",word[xm[3]].english);
			printf("\n\n");
	}
	
	printf("���������ѡ��");
	
	choice = getchar();
	fflush(stdin);
	
	if(choice >= 'a'&&choice <= 'z')
	{
		choice = choice -'a';
	 }
	
	else if(choice >= 'A'&&choice <= 'Z')
	{
		choice = choice -'A';
	 }
	 
	  
	if(choice == t)
	{
		printf("��ϲ������^_^ ��");
		score++; 
	}
	else{
	 	printf("��Ǹ������i_i ��");
	 	printf("��ȷ��Ϊ%c��\n", t+'A');
		//score--; 
	} 
	
	getchar();
	 
    }
    
    printf("���β��Խ���������������%d����Ŀ���÷�%d����\n�������Ŭ��Ŷ\n",size,score);
    endtest(size);//�ͷŶ�̬��Դ 
    
} 

