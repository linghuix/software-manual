### SPSS 两两比较



方差不齐的时候，可以有多种方式进行两两比较

1. 方差不齐的 **t 检验** / **方差检验**
2. 变量转换后使用普通 **t 检验** / **方差检验**
3. **非参数分析**



非正态的时候，可以有多种方式进行两两比较

1. 对所有数据非线性转换后，若所有数据都转为正态，可使用**普通 t 检验 / 方差检验**
2. **非参数分析**



<img src="检验算法选择总结.assets/18697550-757a317d411f1207.png" style="zoom:67%;" />  

————————————————

https://www.jianshu.com/p/75c32e1dac78



### 数据预分析



#### 正态分布检验

* Jarque-Bera  tests

* Shapiro-Wilk tests

* **Kolmogorov-Smirnov test** 

  适合大样本情况下， 200~2000以上

  `分析 - 统计描述 - 探索` 可进行 `Kolmogorov-Smirnov test `和 `Shapiro-Wilk test` 

  `分析 - 非参数检验- 旧 - 1样本K-S` 可进行 `Kolmogorov-Smirnov test `

* **Shapiro-Wilk test**

  适合小样本情况下， 200~2000以下



### 方差分析



#### 假定方差齐次性`

方差分析 (One way ) ：LSD  / Bonferroni / S-N-K ...

**要求** ： `正态分布`, `假定方差齐次性`, `变量独立性`, `各个组别样本量相差不大` 。

**特点**： 独立 T 分析进行两两比较时，会使得每组的第一类错误率累计起来，最后会产生远大于`0.05`的一类错误率。所以切忌使用T分析，此时方差分析就可以完美的对不同的组别两两比较。 

<img src="检验算法选择总结.assets/20160718224839543" style="zoom:25%;" />

**比较对象**：两两组别的均值显著性比较。



    LSD法
    即最小显著差法(Least Significance Difference Method)，是最简单的比较方法之一。
    用t检验完成各组均值间的配对比较，对多重比较误差率不进行校正。
    
    Sidak法
    实际上是Sidak校正在LSD法上的应用。
    用t检验完成各组均值间的配对比较，对多重比较误差率进行校正。
    Sidak法比LSD法保守得多。
    
    Bonferroni法
    实际上是Bonferroni校正在LSD法上的应用
    用t检验完成各组均值间的配对比较，对多重比较误差率进行校正
    Bonferroni法比Sidak法保守一些。
    
    Scheffe法
    对多组均数间的线性组合是否为0进行检验，即(Contrast)
    
    Dunnett法
    常用于多个实验组与一个对照组间的比较
    设定此法后，激活Control Category 参数框，展开小菜单，选择对照组。 

多个实验组与一个对照组的比较，一般采用Dunnett法。

需要进行任意两组间的比较而各组样本含量相同，选用Tukey法。

需要进行任意两组间的比较而各组样本含量不相同，选用Scheffe法。

https://blog.csdn.net/liuyuan_jq/article/details/51946655





#### 假定方差不齐次性`

Tamhane's T2 / Dunnett's T3 / Games-Howell / Dunnett's C

**要求** ： `正态分布`，`变量独立性`，`各个组别样本量相差不大` 。

如果方差不齐时，一般都选Dunnett's T3。

    Tamhane’s T2 基于 t 检验的保守成对比较。当方差不相等时，适合使用此检验。
    
    Dunnett’s T3 基于学生化最大值模数的成对比较检验。当方差不相等时，适合使用此检验。
    
    Games-Howell 当方差不相等时的一种比较灵活的配对比较。
    
    Dunnett’s C 基于学生化范围的成对比较检验。当方差不相等时，适合使用此检验。
————————————————

https://blog.csdn.net/liuyuan_jq/article/details/51946655





**多组数据差异性分析，其中既有符合正态分布的，也有不符合正态分布的，该用什么检验方法呀？** 

https://www.zhihu.com/question/438589529

使用log等非线性函数变换数据，使得数据符合正态分布；或者如果数据量大直接用非参数比较。



#### 理论分析与SPSS操作

[csdn 网址](https://blog.csdn.net/liuyuan_jq/article/details/51946655?utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromMachineLearnPai2%7Edefault-3.control&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromMachineLearnPai2%7Edefault-3.control) 



### 非参数分析



> 平时我们常用的t检验、卡方检验、方差分析等方法都要求样本服从特定的分布（比如t检验要求样本服从正态分布），这些方法被称为参数检验方法。但有些数据并不符合参数检验的要求，最常见的情况是数据不符合正态分布，这时可以使用非参数检验的方法。



5种非参数检验方法的SPSS操作教程 https://www.mediecogroup.com/zhuanlan/lessons/980/



[两独立样本：Mann-Whitney U检验（简洁版）](http://mp.weixin.qq.com/s?__biz=MzI2OTQyMzc5MA==&mid=2247484048&idx=1&sn=664d750dd5d5f08bd2a1eb278a2b1715&chksm=eae1c751dd964e479f8ed8f3de7af4d5c5f8db0163176e867f81826cddb6bdfdf7598fd2e9ed&scene=21#wechat_redirect)

详细介绍见  [How the Mann-Whitney test works](SPSS.assets\How the Mann-Whitney test works.md)  



[配对样本：Wilcoxon符号秩检验 (简洁版)](https://www.mediecogroup.com/zhuanlan/lessons/126/)



[多个独立样本：Kruskal-Wallis H检验 (简洁版)](https://www.mediecogroup.com/zhuanlan/lessons/165/)



[多个相关样本：Friedman检验](https://www.mediecogroup.com/zhuanlan/lessons/145/)

[Friedman Test](https://www.statstest.com/friedman-test/#:~:text=The%20Friedman%20Test%20is%20a%20statistical%20test%20used,and%20have%20a%20similar%20spread%20across%20your%20groups.z) is used to determine if 3 or more measurements from the same group of  subjects are significantly different from each other on a skewed  variable of interest.



[多个相关样本：Cochran's Q检验](https://www.mediecogroup.com/zhuanlan/lessons/308/)





