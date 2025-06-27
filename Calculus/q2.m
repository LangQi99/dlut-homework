% 1. 极坐标方程 ρ = 3cos(3θ)
theta = 0:0.01:2*pi;
rho = 3*cos(3*theta);
polarplot(theta, rho)
title('ρ = 3cos(3θ)')

% 2. 参数方程
t = 0:0.01:2*pi;
x = 2*(t + sin(t));
y = 2*(cos(t) - 1);
plot(x, y)
title('x=2(t+sint), y=2(cost-1)')

% 3. y = x^(2/3)
x = -10:0.1:10;
y = x.^(2/3);
plot(x, y)
title('y = x^{2/3}')

% 4. y = x*sin(x)
x = -10:0.1:10;
y = x.*sin(x);
plot(x, y)
title('y = x*sin(x)')
