% 验证二项分布B(10, 0.5)和标准正态分布N(0, 1)的归一性

% Part 1: 验证二项分布B(10, 0.5)的分布列的归一性
n = 10;
p = 0.5;
x = 0:n;  % 可能的取值范围：0到10
px = binopdf(x, n, p);  % 计算二项分布的概率质量函数

sum_binom = sum(px);
fprintf('二项分布B(10, 0.5)的概率和为: %.10f\n', sum_binom);

% Part 2: 验证标准正态分布N(0, 1)的密度函数的归一性
% 使用数值积分方法

% 定义标准正态分布的密度函数
f = @(x) (1/sqrt(2*pi)) * exp(-x.^2/2);

% 使用自适应辛普森积分计算（从-inf到+inf的积分用[-10,10]近似）
integral_result = integral(f, -10, 10);
fprintf('标准正态分布N(0, 1)的密度函数积分值为: %.10f\n', integral_result);
