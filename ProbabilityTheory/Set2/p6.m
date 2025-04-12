% 利用5(a)产生的样本分别计算N(μ,σ^2)中参数μ和σ^2的最大似然估计值，并计算其与真实参数值之间的距离。


% 加载5(a)的数据
n = 1000;
X = randn(n, 1);

% 计算最大似然估计
mu_MLE = mean(X);
sigma2_MLE = var(X) * (n-1)/n;  % 注意：最大似然估计的方差分母是n

% 真实参数值
mu_true = 0;
sigma2_true = 1;

% 计算距离
mu_distance = abs(mu_MLE - mu_true);
sigma2_distance = abs(sigma2_MLE - sigma2_true);

% 显示结果
fprintf('最大似然估计结果：\n');
fprintf('μ的估计值 = %.4f (真实值 = %.4f)\n', mu_MLE, mu_true);
fprintf('σ^2的估计值 = %.4f (真实值 = %.4f)\n', sigma2_MLE, sigma2_true);
fprintf('\n与真实参数的距离：\n');
fprintf('|μ_MLE - μ_true| = %.4f\n', mu_distance);
fprintf('|σ^2_MLE - σ^2_true| = %.4f\n', sigma2_distance);

% 绘制估计分布和真实分布的比较
figure;
x = linspace(min(X), max(X), 1000);
plot(x, normpdf(x, mu_MLE, sqrt(sigma2_MLE)), 'b-', 'LineWidth', 2);
hold on;
plot(x, normpdf(x, mu_true, sqrt(sigma2_true)), 'r--', 'LineWidth', 2);
title('估计分布与真实分布的比较');
xlabel('X值');
ylabel('密度');
legend('最大似然估计分布', '真实分布'); 