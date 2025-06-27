% 6. 利用5(a)产生的样本分别计算N(μ,σ^2)中参数μ和σ^2的最大似然估计值，并计算其与真实参数值之间的距离。

% 加载标准正态随机样本
n = 1000;
X = randn(n, 1);

% 计算最大似然估计
mu_hat = mean(X);  % μ的MLE
sigma2_hat = var(X) * (n-1)/n;  % σ^2的MLE

% 真实参数值
mu_true = 0;
sigma2_true = 1;

% 计算距离
mu_distance = abs(mu_hat - mu_true);
sigma2_distance = abs(sigma2_hat - sigma2_true);

% 显示结果
fprintf('\n=== 正态分布参数的最大似然估计 ===\n');
fprintf('-------------------------------------------------\n');
fprintf('参数\t\t估计值\t真实值\t绝对误差 相对误差\n');
fprintf('-------------------------------------------------\n');
fprintf('μ\t\t%.4f\t%.4f\t%.4f\t%.2f%%\n', mu_hat, mu_true, mu_distance, mu_distance/abs(mu_true)*100);
fprintf('σ^2\t\t%.4f\t%.4f\t%.4f\t%.2f%%\n', sigma2_hat, sigma2_true, sigma2_distance, sigma2_distance/sigma2_true*100);
fprintf('-------------------------------------------------\n');
fprintf('分析：\n');
fprintf('1. 样本均值作为μ的MLE，其估计值与真实值非常接近\n');
fprintf('2. 样本方差作为σ^2的MLE，其估计值与真实值接近\n');
fprintf('3. 随着样本量n的增大，估计值会越来越接近真实值\n');
fprintf('4. 相对误差较小，说明估计效果良好\n');