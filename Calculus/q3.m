% 1. 3阶泰勒公式求sin(3°)的近似值
syms x;
taylor_series = taylor(sin(x), x, 'Order', 4); % 3阶泰勒展开
approx = subs(taylor_series, x, 3*pi/180); % 将3°转换为弧度并代入
vpa(approx, 10) % 显示10位有效数字

% 2. 参数方程求导
syms t a;
x = a*(t - sin(t));
y = a*(1 - cos(t));
dydx = diff(y,t)/diff(x,t) % 一阶导数
d2ydx2 = diff(dydx, t)/diff(x,t) % 二阶导数

% 3. 隐函数求导
syms x y;
F = exp(y) + x*y - exp(x);
*69
,.m` q13+6-925%*+6dydx = -diff(F,x)/d+iff(F,y)-