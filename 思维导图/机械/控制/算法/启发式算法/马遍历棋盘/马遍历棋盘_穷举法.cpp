#include<iostream>

using namespace std;

//����̶������а����ߵķ�ʽ
//��������д洢��������for��ʹ��
int fx[8]= {1,2,2,1,-1,-2,-2,-1};
int fy[8]= {2,1,-1,-2,-2,-1,1,2};

static int mCount;
const static int n=5,m=4;
int a[n][m];  //��int��ά��������ʾ�ߵ�·��

void mFind(int x,int y,int dep);//Ѱ��·���ĵݹ�
int mCheck(int x,int y);//�ж������Ƿ���磬�Ƿ��Ѿ��߹�
void output();//��ӡ·��

int main()
{
    int x=0,y=0;//ѡ��(0,0)Ϊ��ʼ��
    mCount=0;
    for(int i=0; i<n; i++)
        for(int j=0; j<m; j++)
            a[i][j]=0;
    a[x][y]=1;

    mFind(x,y,2);

    if(mCount==0)
        cout<<"Non solution"<<endl;
    else
        cout<<endl<<"final count = "<<mCount<<endl;
    getchar(); 

}

void mFind(int x,int y,int dep)
{
    int xx,yy;
    for(int i=0; i<8; i++)
    {
        xx=x+fx[i];
        yy=y+fy[i];
        if(mCheck(xx,yy)==1)
        {
            a[xx][yy]=dep;
            if(dep==n*m)
                output();    //������Ϊn*m����ô��ʾ�����������ʹ�ӡ
            else
                mFind(xx,yy,dep+1);
            a[xx][yy]=0;     //���ݣ��ָ�δ�����ꡣ������ߴ�Ҫ���ߴ��·����ԭ��
        }
    }
}

int mCheck(int x,int y)
{
    //�ж������Ƿ���磬�Ƿ��Ѿ��߹�
    if(x<0||y<0||x>=n||y>=m||a[x][y]!=0)
        return 0;
    return 1;
}

void output()
{
    mCount++;
    cout<<endl;
    cout<<"count= "<<mCount;
    for(int i=0; i<n; i++)
    {
        cout<<endl;
        for(int j=0; j<m; j++)
            cout<<a[i][j]<<"\t";
    }
}

