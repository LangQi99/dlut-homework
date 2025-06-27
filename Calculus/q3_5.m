% 1. 求不定积分
syms x
int1 = int(x^3 * exp(-x^2), x)
int2 = int(1/(x*sqrt(x^2+1)), x)

% 2. 求定积分
int3 = int(x/sin(x)^2, x, pi/4, pi/3)
int4 = int(sin(x)^4 * x * cos(x)^2, x, 0, pi)

% 3. 计算f(x)=3-x^2与g(x)=2x（交点x=1, x=-3）所围成图形的面积
f = @(x) 3 - x.^2;
g = @(x) 2*x;
area = integral(@(x) abs(f(x) - g(x)), -3, 1)

% 4. 计算y=x*sin^2(x), x=0, x=pi所围图形绕x轴和y轴旋转所得体积s
f2 = @(x) x.*sin(x).^2;
Vx = pi * integral(@(x) f2(x).^2, 0, pi) % 绕x轴
Vy = 2*pi * integral(@(x) x.*f2(x), 0, pi) % 绕y轴
