% 生成1000个服从N(3, 2^2)的随机变量
n = 1000;
mu = 3;      % 均值
sigma = 2;   % 标准差
X = randn(n, 1) * sigma + mu;  % 直接使用randn生成标准正态分布并线性变换

% 计算样本均值和样本方差
sample_mean = mean(X);
sample_var = var(X);

% 显示结果
fprintf('理论均值: %.2f\n', mu);
fprintf('样本均值: %.4f\n', sample_mean);
fprintf('理论方差: %.2f\n', sigma^2);
fprintf('样本方差: %.4f\n', sample_var);
