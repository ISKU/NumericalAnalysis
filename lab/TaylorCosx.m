x = pi/4; sum = 0; e = 100; n = 0;
% sum = �ٻ簪, e = ��������(%) n = �ݺ�Ƚ��

fprintf('����: %f\n', cos(pi/4));
while(e > 0.05)
   e = abs((cos(x) - sum)/cos(x)) * 100;
   fprintf('�ٻ簪: %f, ��������: %f\n', sum, e);
   sum = sum + ( (-1)^n * x^(2*n) / factorial(2*n) );
   n = n + 1;
end