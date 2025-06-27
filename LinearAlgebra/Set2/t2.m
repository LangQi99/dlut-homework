% 生成10阶随机矩阵，要求各列和为1
n = 10;
A = rand(n);
A = A ./ sum(A);

% 方法1
[V, D] = eig(A);
eigenvalues = diag(D);

disp('特征值：');
disp(eigenvalues);

[max_eigenvalue, max_idx] = max(abs(eigenvalues));
disp('最大特征值：');
disp(max_eigenvalue);

max_eigenvector = V(:, max_idx);
disp('对应的特征向量：');
disp(max_eigenvector);

verification = A * max_eigenvector - max_eigenvalue * max_eigenvector;
disp('验证结果（应接近0）：');
disp(sum(abs(verification), 'all'));

% 方法2
char_poly = poly(A);
eigenvalues2 = roots(char_poly);

disp('特征多项式方法求得的特征值：');
disp(eigenvalues2);

[max_eigenvalue2, max_idx2] = max(abs(eigenvalues2));
disp('最大特征值：');
disp(max_eigenvalue2);

max_eigenvector2 = null(A - max_eigenvalue2 * eye(n));
max_eigenvector2 = max_eigenvector2 / norm(max_eigenvector2);

disp('对应的特征向量：');
disp(max_eigenvector2);

verification2 = A * max_eigenvector2 - max_eigenvalue2 * max_eigenvector2;
disp('验证结果（应接近0）：');
disp(sum(abs(verification2), 'all'));

