% 1. 求解线性方程组 Ax=b
A1 = rand(5,5);
b = rand(5,1);
x = A1\b;

disp('Ax=b 解向量x = ')
disp(x)
disp('验证结果（应接近0）：')
disp(sum(abs(A1*x - b), 'all'))

% 2. 验证矩阵乘积性质 AA'和A'A
A2 = rand(3,2);
A2_transpose = A2';

AA_t = A2 * A2_transpose;
At_A = A2_transpose * A2;

disp('A*A_T和A_T*A：')
disp('A*A_T矩阵（3x3）= ')
disp(AA_t)
disp('A_T*A矩阵（2x2）= ')
disp(At_A)
