

## 0. AD 库

*.bxl文件转化为AD库
https://blog.csdn.net/cleverhorse/article/details/100732366

### 0.1 封装



### 0.2 元件图



#### 0.2.5 绑定封装



## 1. PCB

### 1.0 布置元件

**一般原则** 

* 一个模块的元器件在美观的情况下**尽可能靠近** 



> **PCB 外框确定** 

在 keepout 层 ( 粉色 ) , 用普通线 Line 绘制 PCB 封闭区域。然后 [右键 - Find Similar Objects...] 选择Keepout 层

上的图形，最后选择 [Design  ->  Board Shape  -> Define from selected objects ]



> E+O+S  设置参考点

用于绘制精确的长度，特别是PCB板子形状，还有与其他板子之间的接口，很有帮助。



> Tool – component placement – arrange within rectangle

可以方便的在原理图中选中对应的元件，然后在PCB文件中，使用这种方法布置，快速的将对应的元件定位到，鼠标所画的方框中



移动器件的时候按键盘的“X”键即可水平翻转器件，按“Y”键为垂直翻转。按空格“Space”可以旋转90度。同时别忘了关掉中文输入法。



> 旋转任意元器件角度布置

Edit --->Move ---> Rotate Selection 或者使用快捷键
E+M+O



> 隐藏 PCB 栅栏图案  PCB界面中右键，选择Option - Grid Manager   双击在 Display 界面选择 

<img src="AD.assets/image-20200917001029692.png" alt="image-20200917001029692" style="zoom:70%;" />



### 1.1 布线准备

> PCB 布线之前需要对，某些器件或者某些功能的布线的属性需要进行特殊配置。便于布线，也便于查错.



#### 1.1.0 PCB层设置

> 导线厚度和层数设置

Design-layer stack manager



#### 1.1.1 RULE 作用域

你新建的每一个 rule 都是有对应的作用域的,只是默认为所有的 net 。

* 你可以新建多个线宽的 rule 分别作用于不同的作用域。
  比如,信号线宽 20mil ,电源线宽 40mil；信号线 via 25mil/18mil ,电源线 via 5mil/38mil 。
  
* 作用域可以用 class (net 的集合) 表示。表示这个 net 集合中的 布线属性。
  
  Class 的新建在 PCB 文件的 design-class 中。
  
  注意从原理图更新到 PCB 时,不要勾上 remove class
  
* **RULE在检查的过程中是按优先级高到低进行的**。所以优先级高的往往设置成针对某个net的rule规则，优先级低的设置成针对所有的net的规则，这样可以实现某些net之外的net的属性定义。*譬如要设置信号线宽  20mil ,电源线宽 40mil。则设置优先级高的为电源相关 NET (GND,VCC,VEE,VDD) 的线宽为 40mil，优先级低的可以是针对所有 NET的线宽为 20mil。* 



#### 1.1.2 RULE配置

通孔 pad 比布线宽稍大。——大小 25mil ,布线宽 20mil

直插焊接孔, 铜直径 / 孔直径 = 1.5mil ～ 3.0mil

低速板,布线宽可以大一些

通常电源线和地线可以宽一些,汇流



### 1.2 布线

> 隐藏部分元器件的飞线

View - Connection - Hide Component Net    然后对应的元器件，即可屏蔽元器件的飞线



#### 1.2.1 自动布线



#### 1.2.2 手动布线



#### Via 和 Pad 的区别

https://blog.csdn.net/pkuyjxu/article/details/6733804

Via   用于电气连接不同层，但是它不与元器件相连。

Pad 用于连接元器件还起到机械固定的作用





### 1.3 铺铜

E-M-G 选择要修改的铺铜区域，然后单击锚点，放开拖动即可。

2. ALtium designer快捷键

隐藏铺铜：1.ctrl+D或者按L选择show/hide选项卡



### 1.4 检验

检验PCB板子  [Reports - Board Information] 

检验所有Net 是否都连接成功，板子大小，板子层数和各层厚度，以及遍布多隔层的via个数(在Multi-Layer上)



### 1.5 Gerber加工文件





## 2. 原理图





## 3. 快速上手



#### 通用操作



自定义快捷键

Ctrl+ 对应的功能按钮,就能弹出对应功能的快捷键设置
很方便

按住鼠标右键拖动可平移

按住鼠标中键拖动可放大

tab 键设置属性

右键取消







#### 原理图

1.  使用原件序号( designator )查找原件，如 R10, U5；按下 j+c，弹出查询输入框，然后输入序号就可以了。



2.  



3.  



4.  




















