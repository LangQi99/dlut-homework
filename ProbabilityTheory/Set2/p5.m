% 第五题：标准正态分布和泊松分布的相关计算


%% (a) 标准正态分布
n = 1000;
X = randn(n, 1);
sample_mean = mean(X);
sample_var = var(X);

figure;
subplot(2,1,1);
histogram(X, 30, 'Normalization', 'pdf');
hold on;
x = linspace(min(X), max(X), 1000);
plot(x, normpdf(x, 0, 1), 'r-', 'LineWidth', 2);
title('标准正态分布直方图');
xlabel('X值');
ylabel('密度');
legend('样本直方图', '理论密度');

fprintf('(a) 标准正态分布：\n');
fprintf('样本均值 = %.4f (理论值 = 0)\n', sample_mean);
fprintf('样本方差 = %.4f (理论值 = 1)\n', sample_var);

%% (b) 泊松分布
n = 100;
lambda = 2;
X = poissrnd(lambda, n, 1);
sample_mean = mean(X);
sample_var = var(X);

subplot(2,1,2);
histogram(X, 'Normalization', 'pdf');
hold on;
x = 0:max(X);
plot(x, poisspdf(x, lambda), 'r-', 'LineWidth', 2);
title('泊松分布直方图 (λ=2)');
xlabel('X值');
ylabel('密度');
legend('样本直方图', '理论密度');

fprintf('\n(b) 泊松分布：\n');
fprintf('样本均值 = %.4f (理论值 = %.4f)\n', sample_mean, lambda);
fprintf('样本方差 = %.4f (理论值 = %.4f)\n', sample_var, lambda);

%% (c) 重复实验
n_repeats = 1000;
n_samples = 100;
lambda = 2;
Y = zeros(n_repeats, 1);

for i = 1:n_repeats
    X = poissrnd(lambda, n_samples, 1);
    Y(i) = mean(X);
end

% 标准化
SY = (Y - lambda) ./ sqrt(lambda/n_samples);

% 计算统计量
mean_SY = mean(SY);
var_SY = var(SY);

fprintf('\n(c) 标准化后的统计量：\n');
fprintf('均值 = %.4f (理论值 = 0)\n', mean_SY);
fprintf('方差 = %.4f (理论值 = 1)\n', var_SY);

%% (d) 比较直方图
figure;
histogram(SY, 30, 'Normalization', 'pdf');
hold on;
x = linspace(min(SY), max(SY), 1000);
plot(x, normpdf(x, 0, 1), 'r-', 'LineWidth', 2);
title('标准化后的泊松样本均值分布');
xlabel('标准化值');
ylabel('密度');
legend('样本直方图', '标准正态分布'); 