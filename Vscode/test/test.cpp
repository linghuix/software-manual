#include "t.h"

//声明全局变量 
extern Word word[];


//测试单词的主体程序 
void test(int size){
	int i,j,t;//
	int flag;//判断是否有重复的干扰选项：0无，1有 
	char choice;//用户测试输入的答案（ABCD） 
	int xm[4];//每个选项对应的单词在数组中的下标 
	int count = 0;//产生4个不同的题目选项 
	int score = 0;//测试得分
	int testType = 0; 
	
	printf("请输入选择测试的类型(1-中文找英文 0-英文找中文)：");
	scanf("%d",&testType);
	fflush(stdin);
	
	//只能按顺序产生题目 
	for(i = 0;i<size;i++){
		system("cls");//清屏，后输出试题题干
		if(!testType){
			printf("%d./%d\n英文：%s	的中文含义为：\n\n",i+1,size,word[i].english);
			
		} 
		
		else{
			printf("%d./%d\n中文：%s	对应的英文为：\n\n",i+1,size,word[i].chinese);
		}
	 
	
	//随机产生四个选项
	srand(time(NULL)) ;
	count = 0;
	while(count <= 4){
		t = rand()%size;
		
		if(t == i){
			continue;//如果和正确答案一致则跳过 
		}
		
		flag = 0;
		
		//如果选项之前已经有了，flag=1 
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
	
	//精妙！只要让正确的选项随机放置 
	t = rand()%4;
	xm[t] = i;
	
	//输出该试题的四个选项
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
	
	printf("请输入你的选择：");
	
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
		printf("恭喜你答对了^_^ ！");
		score++; 
	}
	else{
	 	printf("抱歉你答错了i_i ！");
	 	printf("正确答案为%c。\n", t+'A');
		//score--; 
	} 
	
	getchar();
	 
    }
    
    printf("本次测试结束，您共测试了%d道题目，得分%d道！\n明天继续努力哦\n",size,score);
    endtest(size);//释放动态资源 
    
} 

