% 1. 产生1000个随机变量X服从均匀分布U(0,3)，并利用Y = -6X + 3产生1000个Y。

% 生成1000个U(0,3)随机变量
X = 3 * rand(1000, 1);
% 计算Y
Y = -6 * X + 3;

% 显示前10个样本点
fprintf('=== 前10个样本点 ===\n');
fprintf('X\t\tY\n');
fprintf('----------------\n');
for i = 1:10
    fprintf('%.4f\t%.4f\n', X(i), Y(i));
end
fprintf('----------------\n');

% 保存数据
save('data.mat', 'X', 'Y');