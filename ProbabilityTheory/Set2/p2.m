% 2. 由问题1所产生的数据，分别计算X和Y的方差D(X)和D(Y)，以及协方差Cov(X,Y)和相关系数Corr(X,Y)，并与理论值比较。

% 加载数据
load('data.mat');

% 计算样本统计量
D_X = var(X);
D_Y = var(Y);
Cov_XY = cov(X, Y);
Corr_XY = corrcoef(X, Y);

% 理论值
D_X_theory = (3-0)^2/12;  % U(0,3)的方差
D_Y_theory = (-6)^2 * D_X_theory;  % Y的方差
Cov_XY_theory = -6 * D_X_theory;  % 协方差
Corr_XY_theory = -1;  % 相关系数

% 显示结果
fprintf('\n=== 统计量计算结果 ===\n');
fprintf('----------------------------------------\n');
fprintf('统计量\t\t样本值\t理论值\t相对误差\n');
fprintf('----------------------------------------\n');
fprintf('D(X)\t\t%.4f\t%.4f\t%.2f%%\n', D_X, D_X_theory, abs(D_X-D_X_theory)/D_X_theory*100);
fprintf('D(Y)\t\t%.4f\t%.4f\t%.2f%%\n', D_Y, D_Y_theory, abs(D_Y-D_Y_theory)/D_Y_theory*100);
fprintf('Cov(X,Y)\t%.4f\t%.4f\t%.2f%%\n', Cov_XY(1,2), Cov_XY_theory, abs(Cov_XY(1,2)-Cov_XY_theory)/abs(Cov_XY_theory)*100);
fprintf('Corr(X,Y)\t%.4f\t%.4f\t%.2f%%\n', Corr_XY(1,2), Corr_XY_theory, abs(Corr_XY(1,2)-Corr_XY_theory)/abs(Corr_XY_theory)*100);
fprintf('----------------------------------------\n');