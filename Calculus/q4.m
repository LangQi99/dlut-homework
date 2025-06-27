% 1. 绘制 z^2 = x^2 - y^2 的图形
figure;
[x, y] = meshgrid(-10:0.2:10, -10:0.2:10);
mask = (x.^2 - y.^2) >= 0; % 只保留实数部分
z1 = sqrt(x.^2 - y.^2);
z1(~mask) = NaN;
z2 = -sqrt(x.^2 - y.^2);
z2(~mask) = NaN;
mesh(x, y, z1, 'EdgeColor', 'b');
hold on;
mesh(x, y, z2, 'EdgeColor', 'g');
xlabel('x'); ylabel('y'); zlabel('z');
title('z^2 = x^2 - y^2');
hold off;

% 2. 绘制参数方程空间曲线
figure;
v = linspace(0, 2*pi, 500);
x = 2*cos(v);
y = 2*sin(v);
z = 3*v;
plot3(x, y, z, 'm', 'LineWidth', 2);
xlabel('x'); ylabel('y'); zlabel('z');
title('x=2cosv, y=2sinv, z=3v');
grid on;

% 3. 绘制二次曲面 z = x^2 + y^2 + kxy, k=1,10,-10
figure;
k_list = [1, 10, -10];
colors = {'r', 'g', 'b'};
[x, y] = meshgrid(-5:0.1:5, -5:0.1:5);
for i = 1:length(k_list)
    k = k_list(i);
    z = x.^2 + y.^2 + k*x.*y;
    subplot(1,3,i);
    mesh(x, y, z, 'EdgeColor', colors{i});
    xlabel('x'); ylabel('y'); zlabel('z');
    title(['z = x^2 + y^2 + ', num2str(k), 'xy']);
end

% 4. 绘制马鞍面 z = x^2 - y^2 与 y=1 的交线
figure;
[x, y] = meshgrid(-4:0.1:4, -4:0.1:4);
z = x.^2 - y.^2;
mesh(x, y, z, 'EdgeColor', [0.7 0.7 0.7]);
hold on;
y1 = ones(size(x(1,:)));
z1 = x(1,:).^2 - y1.^2;
plot3(x(1,:), y1, z1, 'r', 'LineWidth', 2);
xlabel('x'); ylabel('y'); zlabel('z');
title('马鞍面 z = x^2 - y^2 与 y=1 的交线');
hold off;