% 1. lim(x->0) (sin(sin(x))/x - 1)
syms x;
limit(sin(sin(x))/x - 1, x, 0)

% 2. lim(n->∞) tan(π/4 + 1/n)^n
syms n;
limit(tan(pi/4 + 1/n)^n, n, inf)

% 3. 单侧极限
syms x;
limit(1/(1 + exp(1/(x-1))), x, 1, 'left')
limit(1/(1 + exp(1/(x-1))), x, 1, 'right')