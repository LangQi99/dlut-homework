% 初始化人口分布向量 (农业、工业、商业)
x0 = [15; 9; 6];

% 构建转移矩阵
P = [0.7, 0.2, 0.1;
     0.2, 0.7, 0.1;
     0.1, 0.1, 0.8];

x1 = P * x0;
x2 = P * x1;

% 计算稳态分布
[V, D] = eig(P);
[~, index] = min(abs(diag(D) - 1));
steady_state = V(:, index) / sum(V(:, index)) * 30;

fprintf('一年后各行业人数（万人）：\n');
fprintf('农业：%.2f\n工业：%.2f\n商业：%.2f\n\n', x1(1), x1(2), x1(3));

fprintf('两年后各行业人数（万人）：\n');
fprintf('农业：%.2f\n工业：%.2f\n商业：%.2f\n\n', x2(1), x2(2), x2(3));

fprintf('经过很多年后的稳态分布（万人）：\n');
fprintf('农业：%.2f\n工业：%.2f\n商业：%.2f\n', steady_state(1), steady_state(2), steady_state(3));
