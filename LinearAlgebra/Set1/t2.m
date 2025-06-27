n = 3; % 使用3阶矩阵进行演示
A = diag(rand(n,1) + 1); % 确保A的对角元素大于1，从而保证可逆
C = diag(rand(n,1));
B = rand(n);
D = rand(n);

left_side = det([A B; C D]);
right_side = det(A)*det(D) - det(B)*det(C);

AD_CB = det(A*D - C*B);

disp('验证结果：')
fprintf('左边|A B;C D| = %f\n', left_side)
fprintf('右边|A||D|-|B||C| = %f\n', right_side)
fprintf('|AD-CB| = %f\n', AD_CB)

% 验证第一个不等式
disp('验证 |A B;C D| ≠ |A||D|-|B||C|：')
fprintf('差值 = %f\n', abs(left_side - right_side))

% 验证第二个等式
disp('验证 |A B;C D| = |AD-CB|：')
fprintf('差值（应接近0）= %f\n', abs(left_side - AD_CB))

% 验证A是否可逆
disp('验证A的行列式（应不为0）：')
fprintf('det(A) = %f\n', det(A))
