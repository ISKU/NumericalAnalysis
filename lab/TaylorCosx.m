x = pi/4; sum = 0; e = 100; n = 0;
% sum = 근사값, e = 참상대오차(%) n = 반복횟수

fprintf('참값: %f\n', cos(pi/4));
while(e > 0.05)
   e = abs((cos(x) - sum)/cos(x)) * 100;
   fprintf('근사값: %f, 참상대오차: %f\n', sum, e);
   sum = sum + ( (-1)^n * x^(2*n) / factorial(2*n) );
   n = n + 1;
end