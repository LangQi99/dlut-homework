 % 4. 通过均匀分布模拟指数分布（样本量增至100000）
% 生成100000个[0,1]上的均匀分布随机数
n = 100000;
U = rand(n, 1);

% 通过逆变换法生成指数分布随机数
% 指数分布E(3)的分布函数为F(x) = 1 - exp(-3x)
% 其反函数为F^(-1)(u) = -ln(1-u)/3
lambda = 3;
X = -log(1 - U) / lambda;

% 计算样本均值和样本方差
sample_mean = mean(X);
sample_var = var(X);

% 计算总体均值和总体方差
% 指数分布E(λ)的均值为1/λ，方差为1/λ^2
true_mean = 1/lambda;
true_var = 1/(lambda^2);

% 输出结果
fprintf('样本量: %d\n', n);
fprintf('样本均值: %.4f\n', sample_mean);
fprintf('总体均值: %.4f\n', true_mean);
fprintf('样本方差: %.4f\n', sample_var);
fprintf('总体方差: %.4f\n', true_var);

% 绘制直方图
figure;
histogram(X, 50, 'Normalization', 'probability');
hold on;
% 绘制理论密度函数
x = linspace(0, max(X), 100);
y = lambda * exp(-lambda * x);
plot(x, y, 'r-', 'LineWidth', 1.5);
title('指数分布E(3)的模拟结果 (n=100000)');
xlabel('x');
ylabel('概率密度');
legend('模拟数据', '理论密度');
grid on;