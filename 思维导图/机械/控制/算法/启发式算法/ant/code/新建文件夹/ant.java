public class ant{
	public Tour tour = new Tour��
	
	//������Ϣ�أ���ʼ��tour
	public void ant(){
		tour.generateIndividual();
	}
	
	//���ݣ�tour.distance ,nessagemanager
	//����tour
	public void update(){
		public Tour tour1 = new Tour��
		
		//��ȡ��ǰʱ��
		long r1 = System.currentTimeMillis();
		random r = new random(r1);
		
		//��ʼ����
		int startindex  = r.nextInt(Tourmanager.numberOfCities);
		tour1.setCity(0,TourManager.getCity(startindex))
	 /**
     * ѡ����һ������
     * @param index ��Ҫѡ���index��������
     * @param messagemanager   ȫ�ֵ���Ϣ����Ϣ
     * @param Tour  ȫ�ֵľ��������Ϣ
     */
		for (index = 1;index <= Tourmanager.numberOfCities ,index++){
			double []p;
        p=new double[TourManager.numberOfCities];//��һ��Ҫ�ߵĳ��е�ѡ�и���
		
        //����ѡ�и�������ϵ��
        double sum=0;
        int currentcity=tour1[index-1];//����������ǰ����
		
        //���㹫ʽ�еķ�ĸ���֣�Ϊ��һ������ѡ�и���ʹ�ã�
        for( int i=0; i<TourManager.numberOfCities; i++){
            if(tour1.containsCity(i)==false)//û�߹��ĳ���
                sum+=(Math.pow(getmess(currentcity,i), messagemanager.alpha)*
                      Math.pow(1.0/distanceTo(tour1.getCity(i)), messagemanager.beta));
        }
		
        //����ÿ�����б�ѡ�еĸ���
        for(int i = 0;i < TourManager.numberOfCities; i++){
            if(tour1.containsCity(i)==false)
				
				//�����߹��ˣ�ѡ�и��ʾ���0
                p[i]=0.0;
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
        for(int i=0;i<TourManager.numberOfCities;i++){//ÿ�ζ���˳���ߡ���������
            sumselect+=p[i];
            if(sumselect>=selectp){
                selectcity=i;
                break;
            }
        }
		
        tour1.setCity(index, TourManager.getCity(index));
		}
        
		tour = tour1.getTour;
    }
} 