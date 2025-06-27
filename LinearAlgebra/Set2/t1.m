A = [1, 1.5, 0; 1.5, -1, 1; 0, 1, 1];
e = eig(A);
disp(e);
if all(e > 0)
  disp("正定");
elseif all(e >= 0)
  disp("半正定");
elseif all(e < 0)
  disp("负定");
else
  disp("不定");
end