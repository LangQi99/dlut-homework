% 1. 计算A+B和A-B
n = 5;
A = rand(n);
B = rand(n);
C = rand(n);
b = rand(n,1);

sum_AB = A + B;
diff_AB = A - B;
disp('1. A+B和A-B的结果：')
disp(sum_AB)
disp(diff_AB)

% 2. 计算A*B+B*A
prod_sum = A*B + B*A;
disp('2. A*B+B*A的结果：')
disp(prod_sum)

% 3. 求解Ax=b并验证克莱姆法则
x = A\b;
disp('3. Ax=b的解：')
disp(x)

D = det(A);
x_cramer = zeros(n,1);
for i = 1:n
    Ai = A;
    Ai(:,i) = b;
    Di = det(Ai);
    x_cramer(i) = Di/D;
end
disp('克莱姆法则求解结果：')
disp(x_cramer)
disp('与MATLAB求解结果的差（应接近0）：')
disp(sum(abs(x_cramer - x), 'all'))

% 4. 计算A,B的行列式、逆矩阵和秩
det_A = det(A);
det_B = det(B);
inv_A = inv(A);
inv_B = inv(B);
rank_A = rank(A);
rank_B = rank(B);
disp('4. A,B的行列式、秩：')
fprintf('det(A)=%f, rank(A)=%d\n', det_A, rank_A)
fprintf('det(B)=%f, rank(B)=%d\n', det_B, rank_B)

% 5. 计算A*B的行列式、逆矩阵和秩，验证行列式性质
AB = A*B;
det_AB = det(AB);
inv_AB = inv(AB);
rank_AB = rank(AB);
disp('5. A*B的行列式、秩：')
fprintf('det(A*B)=%f, rank(A*B)=%d\n', det_AB, rank_AB)
disp('验证det(A*B)=det(A)*det(B)：')
fprintf('det(A*B)与det(A)*det(B)的差值的绝对值（应接近0）: %f\n', abs(det_AB - det_A*det_B))

% 6. 验证(AB)^T = B^T*A^T和(AB)^-1 = B^-1*A^-1
AB_trans = (A*B)';
BtAt = B'*A';
AB_inv = inv(A*B);
BA_inv = inv(B)*inv(A);
disp('6. 验证转置和逆的性质：')
disp('验证(AB)^T = B^T*A^T:')
disp('两个矩阵差值的元素绝对值之和（应接近0）:')
disp(sum(abs(AB_trans - BtAt), 'all'))
disp('验证(AB)^-1 = B^-1*A^-1:') 
disp('两个矩阵差值的元素绝对值之和（应接近0）：')
disp(sum(abs(AB_inv - BA_inv), 'all'))

% 7. 求解AXB=C
X = reshape(kron(B',A)\C(:), size(A));
disp('7. AXB=C的解：')
disp(X)
disp('验证结果（应接近0）：')
verify_X = A*X*B - C;
disp(sum(abs(verify_X), 'all'))
