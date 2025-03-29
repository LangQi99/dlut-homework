% 生成1000个服从N(3, 2^2)的随机变量
n = 1000;
mu = 3;      % 均值
sigma = 2;   % 标准差
X = mu + sigma * randn(n, 1);

% 标准化随机变量
Z = (X - mu) / sigma;

% 计算标准化后随机变量的样本均值和样本方差
z_sample_mean = mean(Z);
z_sample_var = var(Z);

% 显示结果
fprintf('标准化后的理论均值: 0\n');
fprintf('标准化后的样本均值: %.4f\n', z_sample_mean);
fprintf('标准化后的理论方差: 1\n');
fprintf('标准化后的样本方差: %.4f\n', z_sample_var);

% 绘制标准化后的直方图
figure;
histogram(Z, 30, 'Normalization', 'probability');
hold on;
x = linspace(-4, 4, 100);
y = normpdf(x, 0, 1);
plot(x, y, 'r-', 'LineWidth', 1.5);
title('标准化后的正态分布随机变量的直方图');
xlabel('值');
ylabel('概率');
legend('直方图', '理论概率密度函数');
grid on;
