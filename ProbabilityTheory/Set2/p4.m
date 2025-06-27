% 4. 设总体X服从标准正态分布，X1,X2,...,Xn是简单随机样本，分别从密度函数曲线和矩关系上验证统计量X1^2 + X2^2的分布形式。

% 生成标准正态随机样本
n = 10000;
X1 = randn(n, 1);
X2 = randn(n, 1);

% 计算统计量
Z = X1.^2 + X2.^2;

% 绘制直方图
figure;
histogram(Z, 50, 'Normalization', 'pdf');
hold on;

% 绘制卡方分布(2自由度)的密度函数
x = linspace(0, 10, 1000);
y = chi2pdf(x, 2);
plot(x, y, 'r-', 'LineWidth', 2);

% 添加图例和标题
title('X_1^2 + X_2^2 的分布验证');
xlabel('统计量值');
ylabel('概率密度');
legend('样本分布', '理论分布(\chi^2(2))');
grid on;

% 计算样本矩
mean_Z = mean(Z);
var_Z = var(Z);

% 理论矩
mean_theory = 2;  % 卡方分布(2自由度)的期望
var_theory = 4;   % 卡方分布(2自由度)的方差

% 显示结果
fprintf('\n=== 统计量分布验证结果 ===\n');
fprintf('----------------------------------------\n');
fprintf('统计量\t\t样本值\t\t理论值\t\t相对误差\n');
fprintf('----------------------------------------\n');
fprintf('均值\t\t%.4f\t%.4f\t%.2f%%\n', mean_Z, mean_theory, abs(mean_Z-mean_theory)/mean_theory*100);
fprintf('方差\t\t%.4f\t%.4f\t%.2f%%\n', var_Z, var_theory, abs(var_Z-var_theory)/var_theory*100);
fprintf('----------------------------------------\n');
fprintf('结论：\n');
fprintf('1. 样本分布与卡方分布(2自由度)的密度函数曲线吻合\n');
fprintf('2. 样本矩与理论矩接近，验证了统计量服从卡方分布(2自由度)\n');