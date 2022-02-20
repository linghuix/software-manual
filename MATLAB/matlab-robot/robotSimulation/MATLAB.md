## Symbolic Toolbox

> matlab 最强大的工具

### sym 函数

```matlab
sym(t, 'r')  % 默认
sym(t,'d')	% 十进制符号  digits(Num) 定义结果的有效位数
sym(t, 'f')	% 浮点数符号，精确的分母
% The error term eps/40 is the difference between sym('0.1') and sym(0.1).
% 所以，用这些数字相乘的时候，会出现e^-30这些小数
sym(t, 'e')
```

### 数字的符号化

```matlab
% 用符号精准的表达数字
N1 = 1/7
N2 = pi
N3 = 1/sqrt(2)
S1 = sym(N1)
S2 = sym(N2)
S3 = sym(N3)

% 大数字需要转化为字符串，符号化才能不失真
sym(1333333333333333333)
sym('1333333333333333333')

ans =
1333333333333333248
ans =
1333333333333333333
```

### 函数的符号化和操作

```matlab
syms f(x, y)		% 定义x，y
f(x, y) = x^3*y^3

% 微分
d2fy = diff(f, y, 2)
d2fy = diff(f(x+2,y^2), y, 2)

% 绘图
fplot(f(x,2), [-4*pi, 4*pi])

% 泰勒展开
taylor(cos(x), x)

% 无上下限积分
int(cos(x), x)

f(a1, theta_1, theta_2) = @(a1, theta_1, theta_2) T2_0
```

### 符号等式操作

| argnames | Input variables of symbolic function   |
| -------- | ------------- |
| disp(sym) | Display symbolic input         |
| has(sym) | Check if expression contains particular subexpression   |
| pretty(sym) | Prettyprint symbolic expressions   |
| sym(sym) | Create symbolic variables, expressions, functions, matrices|
| symfun(func) | Create symbolic functions  |
| syms(sym) | Shortcut for creating symbolic variables and functions       |
| symvar(sym) | Find symbolic variables in symbolic expression, matrix, or function。寻找变量，返回变量向量 |
| simplify(sym) | 简化符号等式 |
| rewrite(old,target) | 重写等式，使old,target符号等式，在数学意义上等价。syms x ;rewrite(cos(x),'sin') |
| factor(sym) | 因式分解符号等式factor(sym('12345678901234567890')) |
| expand | 展开等式 |
| collect | 合并同类项 |



```matlab

```

