% Schmidt正交化方法

V = rand(5,4);

Q = zeros(5,4);
Q(:,1) = V(:,1) / norm(V(:,1));

for i = 2:4
    Q(:,i) = V(:,i);
    for j = 1:i-1
        Q(:,i) = Q(:,i) - (Q(:,j)' * V(:,i)) * Q(:,j);
    end
    Q(:,i) = Q(:,i) / norm(Q(:,i));
end

disp('正交化后的矩阵Q:');
disp(Q);

% 验证正交性
disp('验证正交性 Q_T*Q (应接近单位矩阵):');
disp(Q'*Q);


