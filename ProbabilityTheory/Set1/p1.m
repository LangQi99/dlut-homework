% 生成1000个服从N(3, 2^2)的随机变量
n = 1000;
mu = 3;      % 均值
sigma = 2;   % 标准差
X = mu + sigma * randn(n, 1);

% 计算样本均值和样本方差
sample_mean = mean(X);
sample_var = var(X);

% 显示结果
fprintf('理论均值: %.2f\n', mu);
fprintf('样本均值: %.4f\n', sample_mean);
fprintf('理论方差: %.2f\n', sigma^2);
fprintf('样本方差: %.4f\n', sample_var);

% 绘制直方图
figure;
histogram(X, 30, 'Normalization', 'probability');
hold on;
x = linspace(mu-4*sigma, mu+4*sigma, 100);
y = normpdf(x, mu, sigma);
plot(x, y, 'r-', 'LineWidth', 1.5);
title('正态分布随机变量的直方图');
xlabel('值');
ylabel('概率');
legend('直方图', '理论概率密度函数');
grid on;
