import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
//��Ⱥ�㷨������������⣬TSP������Դ
//http://comopt.ifi.uni-heidelberg.de/software/TSPLIB95/
//�����а�������������ÿ�����еĺ�������
public class Main {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ACO aco;
        aco=new ACO();
        try {
            aco.init("att.txt", 100);//������Ϣ�ļ�����������
            aco.run(1000);//��������
            aco.ReportResult();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}