### 三维模型格式



表面翻译方法产生的复杂模型通常包含空白或缺失的面/实体。



**\*.STL**

STL 文件格式由3D Systems发明，是3D打印机的标准三角语言。所有您设计的表面和曲线都会被取代并转换成网状。网格由一系列的三角形组成，代表着您设计原型中的精确几何含义。属于表面翻译，不支持颜色材质等信息。



**\*.igs、.ige或.iges**

IGES是初始图形交换规范的缩写，属于表面翻译，格式包括基本的零件数据(线、弧、面等)，但缺乏对工程师和程序员至关重要的深入的3D/设计信息(质量、体积、表面属性、尺寸公差等)。



**\*.STP**

STP文件是基于ASCII格式符合 STEP(the Standard for the Exchange of Product Data) 应用协议1988年 ISO 10303-21标准的正文编码的交换结构的三维图像数据。包含所有与IGES相同的CAD信息，以及更可靠的3D零件数据，如材料属性、尺寸公差等。与表面翻译相反，STEP文件依赖于实体模型，实体模型更可靠，更容易编辑，不会出现间隙或表面遗漏。



**\*obj**

obj文件是[3D模型](https://baike.baidu.com/item/3D模型/10831428)文件格式。由Alias|Wavefront公司为[3D建模](https://baike.baidu.com/item/3D建模/3867022)和动画软件"Advanced Visualizer"开发的一种标准。OBJ文件是一种文本文件，可以直接用[写字板](https://baike.baidu.com/item/写字板)打开进行查看和编辑修改。OBJ3.0文件格式支持直线、多边形、三个点以上的表面和自由形态曲线。OBJ文件不包含动画、材质特性、[贴图](https://baike.baidu.com/item/贴图)路径、动力学、粒子等信息。不过可以引用材质库，材质库信息储存在一个后缀是".mtl"的独立文件中。材质库中包含材质的漫射，环境，光泽的RGB的定义值，以及反射，折射，透明度等其它特征。





### keyshot 

![](keyshot.assets/image-20220314005131016.png)



**设置** 

`编辑` - `首选项` 

<img src="keyshot.assets/image-20220314004303900.png" style="zoom: 33%;" />   <img src="keyshot.assets/image-20220314004404716.png" style="zoom:33%;" />  



场景 - 模型的树结构

几何视图



**导入**

AD要保留PCB板子的铜线，布线模型的话，需要导出 3DPDF模型， `Exoskeleton_controller.pdf.mtl `， `Exoskeleton_controller.pdf.obj`



**贴图** 

keyshot会将贴图看作是类似于蒙版的东西，贴图的不同颜色可以**改变被贴图对象的一些属性**，表示凹凸深度，透明度，漫反射，高光等属性。

选择贴图的`模型部分`，进入`材质选项卡`，在`标签`中添加图片，然后`缩放，平移，旋转`到合适的地方，选择需要改变的被贴图对象的属性和参数。

<img src="keyshot.assets/image-20220314001925904.png" style="zoom: 33%;" />    <img src="keyshot.assets/image-20220314004653616.png" style="zoom: 33%;" /> <img src="keyshot.assets/image-20220314004801644.png" style="zoom:50%;" />  <img src="keyshot.assets/image-20220314004831578.png" style="zoom: 50%;" />

图  添加贴图；贴图修改凹凸属性；贴图的缩放，旋转和平移操作； 凹凸的深度设置

<img src="keyshot.assets/image-20220314005024856.png" style="zoom: 33%;" /> 

图 点击贴图的缩放，旋转和平移操作后的界面，橙色方框处为贴图大小



**模型不同面上不同的材质** 

开启`几何视图`，选中一个模型`右键`，选择`工具`，然后`拆分对象表面`。

全拆，可以将一个模型的所有面拆分成很多个零碎的面。

合并，可以合并一些材质需要设置一样的面，方便后期添加材质

<img src="keyshot.assets/image-20220314001032171.png" style="zoom: 33%;" /> 

<img src="keyshot.assets/image-20220314001352659.png" style="zoom: 33%;" /> 