import java.util.Random;
/*
 ������
 */
public class ant {
    /**
     * ���ϻ�õ�·��
     */
    public int[]tour;//��¼�ι۳���˳��
    
    int[] unvisitedcity;//unvisitedcity ȡֵ��0��1��1��ʾû�з��ʹ���0��ʾ���ʹ�
    /**
     * ���ϻ�õ�·������
     */
    public int tourlength;//ĳ��������·���ܳ��ȡ�
    int citys;//���и���
/**
 * ����������ϵ�ĳ��������
 * ͬʱ������ϰ����ֶεĳ�ʼ������
 * @param citycount �ܵĳ�������
 */
    public void RandomSelectCity(int citycount){
        citys=citycount;
        unvisitedcity=new int[citycount];
        tour=new int[citycount+1];
        tourlength=0;
        for(int i=0;i<citycount;i++){
            tour[i]=-1;
            unvisitedcity[i]=1;
        }//��ʼ����������
        
        long r1 = System.currentTimeMillis();//��ȡ��ǰʱ��
        Random rnd = new Random(r1);
        int firstcity = rnd.nextInt(citycount);//���ָ����һ������
        unvisitedcity[firstcity]=0;//0��ʾ���ʹ�
        tour[0]=firstcity;//��ʼ����
    }
    /**
     * ѡ����һ������
     * @param index ��Ҫѡ���index��������
     * @param tao   ȫ�ֵ���Ϣ����Ϣ
     * @param distance  ȫ�ֵľ��������Ϣ
     */
    public void SelectNextCity(int index,double[][]tao,int[][]distance){
        double []p;
        p=new double[citys];//��һ��Ҫ�ߵĳ��е�ѡ�и���
        //����ѡ�и�������ϵ����
        double alpha=1.0;
        double beta=2.0;
        double sum=0;
        int currentcity=tour[index-1];//����������ǰ����
        //���㹫ʽ�еķ�ĸ���֣�Ϊ��һ������ѡ�и���ʹ�ã�
        for(int i=0;i<citys;i++){
            if(unvisitedcity[i]==1)//û�߹��ĳ���
                sum+=(Math.pow(tao[currentcity][i], alpha)*
                        Math.pow(1.0/distance[currentcity][i], beta));
        }
        //����ÿ�����б�ѡ�еĸ���
        for(int i=0;i<citys;i++){
            if(unvisitedcity[i]==0)
                p[i]=0.0;//�����߹��ˣ�ѡ�и��ʾ���0
            else{
                //û�߹�����һ��Ҫ��������еĸ����ǣ�
                p[i]=(Math.pow(tao[currentcity][i], alpha)*
                        Math.pow(1.0/distance[currentcity][i], beta))/sum;
            }
        }
        long r1 = System.currentTimeMillis();
        Random rnd=new Random(r1);
        double selectp=rnd.nextDouble();
        //���̶�ѡ��һ�����У�
        double sumselect=0;
        int selectcity=-1;
        //����ѡ�������ֱ��n�����ʼ������������������ѡ��ó���
        for(int i=0;i<citys;i++){//ÿ�ζ���˳���ߡ���������
            sumselect+=p[i];
            if(sumselect>=selectp){
                selectcity=i;
                break;
            }
        }
        if (selectcity==-1)//�������û���߹�
            System.out.println();
        tour[index]=selectcity;
        unvisitedcity[selectcity]=0;
    }
    /**
     * �������ϻ�õ�·���ĳ���
     * @param distance  ȫ�ֵľ��������Ϣ
     */
    public void CalTourLength(int [][]distance){
        tourlength=0;
        tour[citys]=tour[0];//��һ�����е������һ��Ҫ����ĳ���
        for(int i=0;i<citys;i++){
            tourlength+=distance[tour[i]][tour[i+1]];//��A����ÿ�����н�һ�Σ����ص�A���ܳ��ȡ�
        }    
    }
}