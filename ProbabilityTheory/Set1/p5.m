% 概率论作业 - 泊松逼近二项分布
% 已知条件: 
% p = 0.02 (次品率)
% n1 = 100, n2 = 1000 (抽样数)

% 定义基本参数
p = 0.02;
n1 = 100;
n2 = 1000;

% 计算lambda值
lambda1 = n1 * p;
lambda2 = n2 * p;

% 情况1: n = 100
fprintf('当n = 100时: \n');
% (1) 恰有2件次品的概率
b_prob1 = binomial_prob(n1, p, 2);
p_prob1 = poisson_prob(lambda1, 2);
fprintf('恰有2件次品的概率: \n');
fprintf('二项分布概率: %.6f\n', b_prob1);
fprintf('泊松近似概率: %.6f\n', p_prob1);
fprintf('近似误差: %.6f\n\n', abs(b_prob1 - p_prob1));

% (2) 次品数不超过2件的概率
b_cum1 = cumulative_prob(n1, p, 2, false, lambda1);
p_cum1 = cumulative_prob(n1, p, 2, true, lambda1);
fprintf('次品数不超过2件的概率: \n');
fprintf('二项分布概率: %.6f\n', b_cum1);
fprintf('泊松近似概率: %.6f\n', p_cum1);
fprintf('近似误差: %.6f\n\n', abs(b_cum1 - p_cum1));

% 情况2: n = 1000
fprintf('当n = 1000时: \n');
% (1) 恰有2件次品的概率
b_prob2 = binomial_prob(n2, p, 2);
p_prob2 = poisson_prob(lambda2, 2);
fprintf('恰有2件次品的概率: \n');
fprintf('二项分布概率: %.6f\n', b_prob2);
fprintf('泊松近似概率: %.6f\n', p_prob2);
fprintf('近似误差: %.6f\n\n', abs(b_prob2 - p_prob2));

% (2) 次品数不超过2件的概率
b_cum2 = cumulative_prob(n2, p, 2, false, lambda2);
p_cum2 = cumulative_prob(n2, p, 2, true, lambda2);
fprintf('次品数不超过2件的概率: \n');
fprintf('二项分布概率: %.6f\n', b_cum2);
fprintf('泊松近似概率: %.6f\n', p_cum2);
fprintf('近似误差: %.6f\n', abs(b_cum2 - p_cum2));

% 函数: 计算二项分布概率
function prob = binomial_prob(n, p, k)
    prob = nchoosek(n, k) * p^k * (1-p)^(n-k);
end

% 函数: 计算泊松分布概率
function prob = poisson_prob(lambda, k)
    prob = (lambda^k * exp(-lambda)) / factorial(k);
end

% 函数: 计算累积概率（0到k）
function prob = cumulative_prob(n, p, k, is_poisson, lambda)
    prob = 0;
    for i = 0:k
        if is_poisson
            prob = prob + poisson_prob(lambda, i);
        else
            prob = prob + binomial_prob(n, p, i);
        end
    end
end