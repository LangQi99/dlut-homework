A = randi([-10, 10], 4, 4);
disp('矩阵A:');
disp(A);

B = A(1:3, :);
disp('矩阵B:');
disp(B);

C = A(:, 1:2);
disp('矩阵C:');
disp(C);

D = A(2:4, 3:4);
disp('矩阵D:');
disp(D);

E = B * C;
disp('矩阵E:');
disp(E);
