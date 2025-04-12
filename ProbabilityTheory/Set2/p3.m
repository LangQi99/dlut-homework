% 基于问题1和2，讨论当Y = 2X^n + 3，n分别取0,1,5,20,50时，协方差Cov(X,Y)的变化，进而讨论X和Y的相关系数的变化。


% 加载p1的结果
load('p1_results.mat');

% 设置不同的n值
n_values = [0, 1, 5, 20, 50];
num_n = length(n_values);

% 初始化结果数组
cov_results = zeros(num_n, 1);
corr_results = zeros(num_n, 1);

% 计算每个n值下的协方差和相关系数
for i = 1:num_n
    n = n_values(i);
    Y = 2 * X.^n + 3;
    cov_matrix = cov(X, Y);
    cov_results(i) = cov_matrix(1,2);  % 取协方差矩阵的(1,2)元素
    corr_results(i) = corr(X, Y);
end

% 显示结果
fprintf('不同n值下的协方差和相关系数：\n');
for i = 1:num_n
    fprintf('n = %d:\n', n_values(i));
    fprintf('  Cov(X,Y) = %.4f\n', cov_results(i));
    fprintf('  Corr(X,Y) = %.4f\n', corr_results(i));
end

% 绘制结果图
figure;
subplot(2,1,1);
plot(n_values, cov_results, 'o-');
title('协方差随n的变化');
xlabel('n值');
ylabel('协方差');

subplot(2,1,2);
plot(n_values, corr_results, 'o-');
title('相关系数随n的变化');
xlabel('n值');
ylabel('相关系数'); 