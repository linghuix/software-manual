产生几类文件：有些是在运行是产生，运行后自动删除；其它一些用于分析、重启、后处理、结果转换或其它软件的文件则被保留，详细如下：
1. model_database_name.cae
模型信息、分析任务等
2. model_database_name.jnl
日志文件：包含用于复制已存储模型数据库的ABAQUS/CAE命令
*.cae和 *.jnl构成支持CAE的两个重要文件，要保证在CAE下打开一个项目，这两个文件必须同时存在；
3． job_name.inp
输入文件。由abaqusCommand支持计算起始文件，它也可由CAE打开；
4． job_name.dat
数据文件：文本输出信息，记录分析、数据检查、参数检查等信息。ABAQUS/Explicit 的分析结果不会写入这个文件
5. job_name.sta
状态文件：包含分析过程信息
6. job_name.msg
是计算过程的详悉记录，分析计算中的平衡迭代次数，计算时间， 警告信息，等等可由此文件获得。用STEP模块定义
7. job_name.res
重启动文件，用STEP模块定义
8. job_name.odb
输出数据库文件，即结果文件，需要由Visuliazation打开
9. job_name.fil
也为结果文件，可被其它应用程序读入的分析结果表示格式。ABAQUS/Standard记录分析结果。ABAQUS/Explicit. 的分析结果要写入此文件中则需要转换，convert=select 或convert=all
10. abaqus.rpy
记录一次操作中几乎所有的ABAQUS/CAE命令
11. job_name.lck
阻止并发写入输出数据库，关闭输出数据库则自行删除
12. model_database_name.rec
包含用于恢复内存中模型数据库的ABAQUS/CAE命令
13. job_name.ods
场输出变量的临时操作运算结果，自动删除
14. job_name.ipm
内部过程信息文件：启动ABAQUS/CAE分析时开始写入，记录了从 ABAQUS/Standard或ABAQUS/Explicit 到 ABAQUS/CAE的过程日志
15．job_name.log
日志文件：包含了ABAQUS执行过程的起止时间等
16．job_name.abq
ABAQUS/Explicit模块才有的状态文件，记录分析、继续和恢复命令。为restart所需的文件。
17．job_name.mdl
模型文件：在ABAQUS/Standard和ABAQUS/Explicit中运行数据检查后产生的文件，.在 analysis和continue 指令下被读入并重写，为restart所需的文件。
18．job_name.pac
打包文件：包含了模型信息，仅用于ABAQUS/Explicit ，该文件在执行 analysis、datacheck命令时写入，执行 analysis, continue, recover 指令时读入，restart时需要的文件。
19．job_name.prt
零件信息文件：包含了零件与装配信息.。restart时需要
20．job_name.sel
结果选择文件：用于ABAQUS/Explicit，执行analysis、continue、recover 指令时写入并由 convert=select 指令时读入，为restart所需的文件。
21．job_name.stt
状态外文件：数据检查时写入的文件，在ABAQUS/Standard中可在analysis 、continue 指令下读并写入，在ABAQUS/Explicit中可在analysis 、continue 指令下读入。为restart所需的文件。
22．job_name.psf
脚本文件：用户定义parametric study时需要创建的文件
23．job_name.psr
参数化分析要求的输出结果，为文本格式
24．job_name.par
参数更改后重写的参数形式表示的inp文件
25．job_name.pes
参数更改后重写的inp文件