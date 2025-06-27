% 题目：在球坐标系下计算三重积分∭_D (x^2 + y^2) dxdydz，D为两个球面z=sqrt(4-x^2-y^2)和z=sqrt(1-x^2-y^2)及z=0所围区域

% 设球坐标变换：x = r*sin(phi)*cos(theta), y = r*sin(phi)*sin(theta), z = r*cos(phi)
% x^2 + y^2 = r^2*sin^2(phi)
% 雅可比行列式为 r^2*sin(phi)

% 外球面半径R=2，内球面半径r=1，z=0对应phi=pi/2到phi=0
% theta: 0~2*pi
% r: 1~2
% phi: 0~pi/2

syms r phi theta;
f = r^2 * sin(phi)^2; % x^2 + y^2
jacobian = r^2 * sin(phi);

integrand = f * jacobian;

% 积分顺序：r(1~2), phi(0~pi/2), theta(0~2*pi)
I = int(int(int(integrand, r, 1, 2), phi, 0, pi/2), theta, 0, 2*pi);
I = simplify(I)

disp(['三重积分结果为: ', char(I)]);
