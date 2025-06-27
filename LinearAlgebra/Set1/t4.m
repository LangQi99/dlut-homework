N = 200865083;
digits = [2 0 0 8 6 5 0 8 3];
a = digits(8)*10 + digits(9);
b = digits(4)*10 + digits(5);
c = digits(6)*10 + digits(7);
d = digits(4)*10 + digits(8);
e = digits(1)*10 + digits(8);
f = digits(5)*10 + digits(9);
g = digits(4)*10 + digits(9);
h = digits(5)*10 + digits(7);

A = [a b c d 3 4;
     1 2 3 4 4 3;
     12 15 22 17 5 7;
     e f g h 8 0];

rank_A = rank(A);

[R, pivots] = rref(A);

pivot_cols = pivots;

all_cols = 1:size(A,2);
free_cols = setdiff(all_cols, pivot_cols);

basis = A(:, pivot_cols);

disp('矩阵的秩：');
disp(rank_A);
disp('最大线性无关组：');
disp(basis);

disp('非主元列向量用主元列向量的表示：');
for i = 1:length(free_cols)
    free_col = free_cols(i);
    free_vector = A(:, free_col);
    
    coefficients = basis \ free_vector;
    
    fprintf('第%d列 = ', free_col);
    for j = 1:length(pivot_cols)
        if j > 1
            if coefficients(j) >= 0
                fprintf(' + ');
            else
                fprintf(' - ');
            end
            fprintf('%.4f * 第%d列', abs(coefficients(j)), pivot_cols(j));
        else
            fprintf('%.4f * 第%d列', coefficients(j), pivot_cols(j));
        end
    end
    fprintf('\n');
end

disp('验证结果：');
for i = 1:length(free_cols)
    free_col = free_cols(i);
    free_vector = A(:, free_col);
    reconstructed = zeros(size(A,1), 1);
    coefficients = basis \ free_vector;
    
    for j = 1:length(pivot_cols)
        reconstructed = reconstructed + coefficients(j) * A(:,pivot_cols(j));
    end
    diff = norm(free_vector - reconstructed);
    
    fprintf('第%d列的误差: %.10f\n', free_col, diff);
end
