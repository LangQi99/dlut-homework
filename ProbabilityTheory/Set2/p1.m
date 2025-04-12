% 产生1000个随机变量X服从均匀分布U(0,3)，并利用Y = -6X + 3产生1000个Y。


% 生成1000个U(0,3)的随机变量
X = 3 * rand(1000, 1);

% 计算Y = -6X + 3
Y = -6 * X + 3;

% 保存结果
save('p1_results.mat', 'X', 'Y');

% 绘制X和Y的直方图
figure;
subplot(2,1,1);
histogram(X, 30);
title('X的直方图 (U(0,3))');
xlabel('X值');
ylabel('频数');

subplot(2,1,2);
histogram(Y, 30);
title('Y的直方图 (Y = -6X + 3)');
xlabel('Y值');
ylabel('频数');


