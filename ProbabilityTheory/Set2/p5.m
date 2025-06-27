% 5. (a) 产生1000个标准正态随机变量，计算样本期望和样本方差，并画所对应的直方图。
% (b) 产生一组长度为100的泊松随机向量x，即x = (x1,x2,...,x100)，其中xi(i = 1,2,...,100)服从泊松分布P(2)。
% (c) 重复产生(b)中的泊松随机向量1000次，得到1000组长度为100的随机观察。计算每组向量的均值yi(i = 1,2,...,1000)。
% (d) 画syi(i = 1,2,...,1000)的直方图，并与(a)中由标准正态随机变量所生成的直方图比较并讨论异同。

% (a) 标准正态随机变量
n = 1000;
X = randn(n, 1);
mean_X = mean(X);
var_X = var(X);

figure(1);
histogram(X, 50, 'Normalization', 'pdf');
title('标准正态随机变量的直方图');
xlabel('随机变量值');
ylabel('概率密度');
grid on;

% (b) 泊松随机向量
lambda = 2;
x = poissrnd(lambda, 100, 1);
mean_x = mean(x);
var_x = var(x);

figure(2);
histogram(x, 50, 'Normalization', 'pdf');
title('泊松随机向量的直方图');
xlabel('随机变量值');
ylabel('概率密度');
grid on;

% (c) 重复实验
n_repeats = 1000;
y = zeros(n_repeats, 1);
for i = 1:n_repeats
    x = poissrnd(lambda, 100, 1);
    y(i) = mean(x);
end

% 标准化
s_y = (y - lambda) / sqrt(lambda/100);

% (d) 绘制标准化后的直方图
figure(3);
histogram(s_y, 50, 'Normalization', 'pdf');
hold on;
x = linspace(-4, 4, 1000);
y = normpdf(x, 0, 1);
plot(x, y, 'r-', 'LineWidth', 2);
title('标准化后的泊松样本均值直方图与标准正态分布比较');
xlabel('标准化后的样本均值');
ylabel('概率密度');
legend('标准化泊松样本均值', '标准正态分布');
grid on;

% 显示结果
fprintf('\n=== 实验结果分析 ===\n');
fprintf('----------------------------------------\n');
fprintf('实验\t\t样本均值\t样本方差\t理论值\n');
fprintf('----------------------------------------\n');
fprintf('(a) 标准正态\t%.4f\t%.4f\t0,1\n', mean_X, var_X);
fprintf('(b) 泊松分布\t%.4f\t%.4f\t2,2\n', mean_x, var_x);
fprintf('----------------------------------------\n');
fprintf('结论：\n');
fprintf('1. 标准正态随机变量的样本均值和方差接近理论值(0,1)\n');
fprintf('2. 泊松随机向量的样本均值和方差接近理论值(2,2)\n');
fprintf('3. 标准化后的泊松样本均值分布近似服从标准正态分布\n');
fprintf('4. 这验证了中心极限定理，即独立同分布随机变量的均值\n');
fprintf('   在样本量足够大时近似服从正态分布\n');