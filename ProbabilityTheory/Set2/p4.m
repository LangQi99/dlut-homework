% 设总体X服从标准正态分布，X1,X2,...,Xn是简单随机样本，分别从密度函数曲线和矩关系上验证统计量X1^2 + X2^2的分布形式。


% 设置参数
n = 10000;  % 样本数量
m = 2;      % 样本大小

% 生成标准正态随机样本
X = randn(n, m);

% 计算统计量 T = X1^2 + X2^2
T = sum(X.^2, 2);

% 计算理论卡方分布(2自由度)的密度函数
x = linspace(0, max(T), 1000);
chi2_pdf = chi2pdf(x, 2);

% 绘制直方图和理论密度曲线
figure;
histogram(T, 50, 'Normalization', 'pdf');
hold on;
plot(x, chi2_pdf, 'r-', 'LineWidth', 2);
title('统计量T = X1^2 + X2^2的分布');
xlabel('T值');
ylabel('密度');
legend('样本直方图', '理论卡方分布(2自由度)');

% 计算样本矩和理论矩
sample_mean = mean(T);
sample_var = var(T);
theory_mean = 2;  % 卡方分布(2自由度)的期望
theory_var = 4;   % 卡方分布(2自由度)的方差

% 显示结果
fprintf('矩的比较：\n');
fprintf('样本均值 = %.4f (理论值 = %.4f)\n', sample_mean, theory_mean);
fprintf('样本方差 = %.4f (理论值 = %.4f)\n', sample_var, theory_var); 