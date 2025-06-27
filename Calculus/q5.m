% 1. 全微分和二阶偏导数
syms x y;
z = sqrt(x^2 + y^2);
dzx = diff(z, x) % 对x的一阶偏导
dzy = diff(z, y) % 对y的一阶偏导
dzxx = diff(z, x, 2) % 对x的二阶偏导
dzyy = diff(z, y, 2) % 对y的二阶偏导
dzxy = diff(diff(z, x), y) % 混合偏导

% 2. 求极值
syms x y;
f = x^4 - 8*x*y + 2*y^2 - 3;
fx = diff(f, x); % 对x偏导
fy = diff(f, y); % 对y偏导
% 解方程组fx=0, fy=0求临界点
[x_crit, y_crit] = solve(fx == 0, fy == 0, x, y);
% 使用二阶导数判别法判断极值性质
for i = 1:length(x_crit)
    x0 = x_crit(i);
    y0 = y_crit(i);
    fxx = subs(diff(fx, x), {x, y}, {x0, y0});
    fyy = subs(diff(fy, y), {x, y}, {x0, y0});
    fxy = subs(diff(fx, y), {x, y}, {x0, y0});
    D = fxx*fyy - fxy^2;
    if D > 0
        if fxx > 0
            fprintf('在点(%f, %f)处有极小值\n', double(x0), double(y0));
        else
            fprintf('在点(%f, %f)处有极大值\n', double(x0), double(y0));
        end
    elseif D < 0
        fprintf('点(%f, %f)不是极值点\n', double(x0), double(y0));
    else
        fprintf('点(%f, %f)无法判断\n', double(x0), double(y0));
    end
end