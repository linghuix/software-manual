
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.*;


//Main Class


public class GreedSnake extends KeyAdapter{


JFrame mainFrame;
Canvas paintCanvas;
JLabel labelScore;//�Ʒ���
SnakeModel snakeModel=null;// ��
public static final int DEFAULT_WIDTH=500;
public static final int DEFAULT_HEIGHT=300;
public static final int nodeWidth=10;
public static final int nodeHeight=10;


//GreedSnake():��ʼ����Ϸ����



public GreedSnake(){


//���ý���Ԫ��
mainFrame = new JFrame("̰������Ϸ");
Container cp=mainFrame.getContentPane();
labelScore=new JLabel("���÷���Ϊ:",JLabel.CENTER);
cp.add(labelScore,BorderLayout.NORTH);
paintCanvas=new Canvas();
paintCanvas.setSize(DEFAULT_WIDTH+1,DEFAULT_HEIGHT+1);
paintCanvas.addKeyListener(this);
cp.add(paintCanvas,BorderLayout.CENTER);
JPanel panelButtom=new JPanel();
panelButtom.setLayout(new BorderLayout());
JLabel labelHelp;// ������Ϣ
labelHelp=new JLabel("�� PageUP �� PageDown ���ı��ٶ�",JLabel.CENTER);
panelButtom.add(labelHelp,BorderLayout.NORTH);
labelHelp=new JLabel("�� Enter �� S �����¿�ʼ��Ϸ",JLabel.CENTER);
panelButtom.add(labelHelp,BorderLayout.CENTER);
labelHelp=new JLabel("�� SPACE ���� P ����ͣ��Ϸ",JLabel.CENTER);
panelButtom.add(labelHelp,BorderLayout.SOUTH);
cp.add(panelButtom,BorderLayout.SOUTH);
mainFrame.addKeyListener(this);
mainFrame.pack();
mainFrame.setResizable(false);//���ô��ڴ�С���ܱ仯
mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
mainFrame.setVisible(true);
begin();
}


//keyPressed():�������


public void keyPressed(KeyEvent e){


int keyCode=e.getKeyCode();
if(snakeModel.running)
switch(keyCode){
case KeyEvent.VK_UP:
snakeModel.changeDirection(SnakeModel.UP);
break;
case KeyEvent.VK_DOWN:
snakeModel.changeDirection(SnakeModel.DOWN);
break;
case KeyEvent.VK_LEFT:
snakeModel.changeDirection(SnakeModel.LEFT);
break;
case KeyEvent.VK_RIGHT:
snakeModel.changeDirection(SnakeModel.RIGHT);
break;
case KeyEvent.VK_ADD:
case KeyEvent.VK_PAGE_UP:
snakeModel.speedUp();// ����
break;
case KeyEvent.VK_SUBTRACT:
case KeyEvent.VK_PAGE_DOWN:
snakeModel.speedDown();// ����
break;
case KeyEvent.VK_SPACE:
case KeyEvent.VK_P:
snakeModel.changePauseState();// ��ͣ�����
break;
default:
}
//���¿�ʼ
if(keyCode==KeyEvent.VK_S || keyCode==KeyEvent.VK_ENTER){
snakeModel.running=false;
begin();
}
}


//repaint������������Ϸ���棨�����ߺ�ʳ�


void repaint(){
Graphics g=paintCanvas.getGraphics();
//draw background
g.setColor(Color.LIGHT_GRAY);
g.fillRect(0,0,DEFAULT_WIDTH,DEFAULT_HEIGHT);
//draw the snake
g.setColor(Color.BLACK);
LinkedList na=snakeModel.nodeArray;
Iterator it=na.iterator();
while(it.hasNext()){


Node n=(Node)it.next();
drawNode(g,n);
}
// draw the food
g.setColor(Color.RED);
Node n=snakeModel.food;
drawNode(g,n);
updateScore();
}


//drawNode�������滭ĳһ��㣨�����ʳ�


private void drawNode(Graphics g,Node n){
g.fillRect(n.x*nodeWidth,n.y*nodeHeight,nodeWidth-1,nodeHeight-1);
}


//updateScore�������ı�Ʒ���


public void updateScore(){
String s="���÷���Ϊ: "+snakeModel.score;
labelScore.setText(s);
}


//begin��������Ϸ��ʼ������̰����


void begin(){


if(snakeModel==null||!snakeModel.running){
snakeModel=new SnakeModel(this,DEFAULT_WIDTH/nodeWidth,
DEFAULT_HEIGHT/nodeHeight);
(new Thread(snakeModel)).start();
}
}


//main������������


public static void main(String[] args){


GreedSnake gs=new GreedSnake();
}
}


//Node:�����


class Node{
int x;
int y;
Node(int x,int y){
this.x=x;
this.y=y;
}
}


//SnakeModel:̰����ģ��


class SnakeModel implements Runnable{


GreedSnake gs;
boolean[][] matrix;// �������ݱ�����������
LinkedList nodeArray=new LinkedList();
Node food;
int maxX;//�����
int maxY;//��󳤶�
int direction=2;//����
boolean running=false;
int timeInterval=200;// ���ʱ�䣨�ٶȣ�
double speedChangeRate=0.75;// �ٶȸı�̶�
boolean paused=false;// ��Ϸ״̬
int score=0;
int countMove=0;
// UP��DOWN��ż����RIGHT��LEFT������
public static final int UP=2;
public static final int DOWN=4;
public static final int LEFT=1;
public static final int RIGHT=3;


//GreedModel():��ʼ������


public SnakeModel(GreedSnake gs,int maxX,int maxY){


this.gs=gs;
this.maxX=maxX;
this.maxY=maxY;
matrix=new boolean[maxX][];
for(int i=0;i<maxX;++i){
matrix[i]=new boolean[maxY];
Arrays.fill(matrix[i],false);// û���ߺ�ʳ��ĵ�����false
}
//��ʼ��̰����
int initArrayLength=maxX>20 ? 10 : maxX/2;
for(int i=0;i<initArrayLength;++i){
int x=maxX/2+i;
int y=maxY/2;
nodeArray.addLast(new Node(x,y));
matrix[x][y]=true;// ������true
}
food=createFood();
matrix[food.x][food.y]=true;// ʳ�ﴦ��true
}


//changeDirection():�ı��˶�����


public void changeDirection(int newDirection){


if(direction%2!=newDirection%2){// �����ͻ
direction=newDirection;
}
}


//moveOn():̰�����˶�����


public boolean moveOn(){


Node n=(Node)nodeArray.getFirst();
int x=n.x;
int y=n.y;
switch(direction){
case UP:
y--;
break;
case DOWN:
y++;
break;
case LEFT:
x--;
break;
case RIGHT:
x++;
break;
}
if((0<=x&&x<maxX)&&(0<=y&&y<maxY)){


if(matrix[x][y]){// �Ե�ʳ�����ײ������


if(x==food.x&&y==food.y){// �Ե�ʳ��


nodeArray.addFirst(food);// ��ͷ������һ���

//�Ʒֹ������ƶ����Ⱥ��ٶ��й�
int scoreGet=(10000-200*countMove)/timeInterval;
score+=scoreGet>0 ? scoreGet : 10;
countMove=0;
food=createFood();

matrix[food.x][food.y]=true;
return true;
}
else return false;// ײ������
}
else{//ʲô��û������
nodeArray.addFirst(new Node(x,y));// ����ͷ��
matrix[x][y]=true;
n=(Node)nodeArray.removeLast();// ȥ��β��
matrix[n.x][n.y]=false;
countMove++;
return true;
}
}
return false;//Խ�磨ײ��ǽ�ڣ�
}


/*����һ��̰������Ϸ�Ĵ��룬˭�ܰ��ҽ���һ�£�̰���߳�������й��̣����в���*/
//run():̰�����˶��߳�


public void run(){
running=true;
while(running){
try{
Thread.sleep(timeInterval);
}
catch(Exception e){
break;
}
if(!paused){


if(moveOn()){// δ����
gs.repaint();
}
else{//��Ϸ����
JOptionPane.showMessageDialog(null,"GAME OVER",
"Game Over",JOptionPane.INFORMATION_MESSAGE);
break;
}
}
}
running=false;
}


//createFood():����ʳ�Ｐ���õص�


private Node createFood(){


int x=0;
int y=0;
do{
Random r=new Random();
x=r.nextInt(maxX);
y=r.nextInt(maxY);
}
while(matrix[x][y]);
return new Node(x,y);
}


//speedUp():�ӿ����˶��ٶ�


public void speedUp(){
timeInterval*=speedChangeRate;
}


//speedDown():�������˶��ٶ�


public void speedDown(){


timeInterval/=speedChangeRate;
}


//changePauseState(): �ı���Ϸ״̬����ͣ�������


public void changePauseState(){


paused=!paused;
}
}