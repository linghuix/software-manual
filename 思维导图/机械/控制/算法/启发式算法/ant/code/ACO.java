import java.io.*;
/**
 *��Ⱥ�Ż��㷨���������TSP����
 */
public class ACO {
   
    ant []ants; //��������Ⱥ
    int antcount;//���ϵ�����
    int [][]distance;//��ʾ���м����
    double [][]tao;//��Ϣ�ؾ���
    int citycount;//��������
    int[]besttour;//�������·��
    int bestlength;//������Ž�ĳ���
	
/**
 * ��ȡ�����ļ�
 * ͬʱ��������࣬�������꣬��Ϣ�صĳ�ʼ������
 * @param filename tsp�����ļ�
 * @param antnum ϵͳ�õ����ϵ�����
 */
    //
    //
    public void init(String filename,int antnum) throws FileNotFoundException, IOException{
        antcount=antnum;
        ants=new ant[antcount];
        //��ȡ����tsp������ݰ�����I����������е�X,Y����
        int[] x;
        int[] y;
        String strbuff;
        BufferedReader tspdata = new BufferedReader(new InputStreamReader(new FileInputStream(filename)));
        strbuff = tspdata.readLine();//��ȡ��һ�У��������������ļ���ʽ��ȡ��
        citycount = Integer.valueOf(strbuff);
        distance = new int[citycount][citycount];
        x = new int[citycount];
        y = new int[citycount];
        for (int citys = 0; citys < citycount; citys++) {
            strbuff = tspdata.readLine();
            String[] strcol = strbuff.split(" ");
            x[citys] = Integer.valueOf(strcol[1]);//��ȡÿ�����ݵĵ�2�������ּ�������
            y[citys] = Integer.valueOf(strcol[2]);
        }
        //������������֮��ľ�����󣬲����¾������
        for (int city1 = 0; city1 < citycount - 1; city1++) {
            distance[city1][city1] = 0;
            for (int city2 = city1 + 1; city2 < citycount; city2++) {
                distance[city1][city2] = (int) (Math.sqrt((x[city1] - x[city2]) * (x[city1] - x[city2])
                        + (y[city1] - y[city2]) * (y[city1] - y[city2])));
                distance[city2][city1] = distance[city1][city2];//��������ǶԳƾ���
            }
        }
        distance[citycount - 1][citycount - 1] = 0;
        //��ʼ����Ϣ�ؾ���
        tao=new double[citycount][citycount];
        for(int i=0;i<citycount;i++)
        {
            for(int j=0;j<citycount;j++){
                tao[i][j]=0.1;
            }
        }
        bestlength=Integer.MAX_VALUE;
        besttour=new int[citycount+1];
        //�����������
        for(int i=0;i<antcount;i++){
            ants[i]=new ant();
            ants[i].RandomSelectCity(citycount);
        }
    }
/**
 * ���������ܵ�·�����ȣ�������Ϣ�ؾ������·������
 * ͬʱ��������������Ͻ�����һ��ѭ��
 * @param maxgen ACO�����ѭ������
 */
    public void run(int maxgen){
        for(int runtimes=0;runtimes<maxgen;runtimes++){
            //ÿ�ε������������϶�Ҫ����һ�飬��һ��
            //System.out.print("no>>>"+runtimes);
            //ÿһֻ�����ƶ��Ĺ���
            for(int i=0;i<antcount;i++){
                for(int j=1;j<citycount;j++){
                    ants[i].SelectNextCity(j,tao,distance);//ÿֻ���ϵĳ��й滮
                }
                //�������ϻ�õ�·������
                ants[i].CalTourLength(distance);
                if(ants[i].tourlength<bestlength){
                    //��������·��
                    bestlength=ants[i].tourlength;
                    //runtimes���������ѭ������������ֻ�е������µ�����·����ʱ��Ż���ʾ������䡣
                    //�������û�и��Ž⣨�������������ֱ�������
                    System.out.println("��"+runtimes+"��(�ε���)�������µ�����·�����ȣ�"+bestlength);
                    for(int j=0;j<citycount+1;j++)
                        besttour[j]=ants[i].tour[j];//����·��
                }
            }
            //������Ϣ�ؾ���
            UpdateTao();
            //���������������
            for(int i=0;i<antcount;i++){
                ants[i].RandomSelectCity(citycount);
            }
        }
       }
    /**
     * ������Ϣ�ؾ���
     */
    private void UpdateTao(){
        double rou=0.5;
        //��Ϣ�ػӷ�
        for(int i=0;i<citycount;i++)
            for(int j=0;j<citycount;j++)
                tao[i][j]=tao[i][j]*(1-rou);
        //��Ϣ�ظ���
        for(int i=0;i<antcount;i++){
            for(int j=0;j<citycount;j++){
                tao[ants[i].tour[j]][ants[i].tour[j+1]]+=1.0/ants[i].tourlength;//���������߹�ʱ��������Ϣ��
            }
        }
    }
    /* ����������н��
     */
    public void ReportResult(){
        System.out.println("����·��������"+bestlength);
        System.out.println("��Ⱥ�㷨����·�������"); 
		System.out.print(besttour[0]);
        for(int j=1;j<citycount+1;j++)
            System.out.print(">>"+besttour[j]);//�������·��
		
    }
}