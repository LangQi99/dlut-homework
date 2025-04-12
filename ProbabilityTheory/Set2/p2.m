% 由问题1所产生的数据，分别计算X和Y的方差D(X)和D(Y)，以及协方差Cov(X,Y)和相关系数Corr(X,Y)，并与理论值比较。


% 加载p1的结果
load('p1_results.mat');

% 计算样本统计量
D_X = var(X);
D_Y = var(Y);
Cov_XY = cov(X,Y);
Corr_XY = corrcoef(X,Y);

% 计算理论值
% 对于U(0,3)，理论方差 = (b-a)^2/12 = (3-0)^2/12 = 9/12 = 0.75
D_X_theory = 9/12;
% Y = -6X + 3，所以D(Y) = (-6)^2 * D(X) = 36 * 0.75 = 27
D_Y_theory = 36 * D_X_theory;
% Cov(X,Y) = Cov(X, -6X + 3) = -6 * Cov(X,X) = -6 * D(X) = -6 * 0.75 = -4.5
Cov_XY_theory = -6 * D_X_theory;
% Corr(X,Y) = Cov(X,Y) / sqrt(D(X)*D(Y)) = -4.5 / sqrt(0.75 * 27) = -1
Corr_XY_theory = -1;

% 显示结果
fprintf('样本统计量：\n');
fprintf('D(X) = %.4f (理论值: %.4f)\n', D_X, D_X_theory);
fprintf('D(Y) = %.4f (理论值: %.4f)\n', D_Y, D_Y_theory);
fprintf('Cov(X,Y) = %.4f (理论值: %.4f)\n', Cov_XY(1,2), Cov_XY_theory);
fprintf('Corr(X,Y) = %.4f (理论值: %.4f)\n', Corr_XY(1,2), Corr_XY_theory);

% 绘制散点图
figure;
scatter(X, Y, 10, 'filled');
title('X和Y的散点图');
xlabel('X');
ylabel('Y'); 