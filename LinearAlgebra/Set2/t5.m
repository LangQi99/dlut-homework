help eigs

n = 1000;
A = spdiags([ones(n,1) -2*ones(n,1) ones(n,1)], [-1 0 1], n, n);

opts.maxit = 1000;    
opts.tol = 1e-6;    
opts.v0 = ones(n,1); 

[V, D] = eigs(A, 6, 'largestabs', opts);

disp('最大的6个特征值：');
diag(D)

lambda1 = D(1,1);
v1 = V(:,1);
err = norm(A*v1 - lambda1*v1);
fprintf('验证误差: %e\n', err);
