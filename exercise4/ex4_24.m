a = 1; b = -5000.002; c=10;

fprintf('1�� ���ǰ���: x1: %f\n', ((-1)*b + sqrt(b^2 - 4*a*c)) / (2*a) );
fprintf('1�� ���ǰ���: x2: %f\n', ((-1)*b - sqrt(b^2 - 4*a*c)) / (2*a) );
fprintf('2�� ���ǰ���: x1: %f\n', -2*c / (b + sqrt(b^2 - 4*a*c)) );
fprintf('2�� ���ǰ���: x2: %f\n', -2*c / (b - sqrt(b^2 - 4*a*c)) );

fprintf('sqrt(b^2-4ac) = %f\n', sqrt(5000.002^2 - 4*1*10));

fprintf('\n�������� 5�ڸ� ������ ����� �� ���ǰ����� ��\n');
fprintf('1�� ���ǰ���: x1: %f\n', (5000.0 + 4999.9) / 2 );
fprintf('1�� ���ǰ���: x2: %f\n', (5000.0 - 4999.9) / 2 );
fprintf('2�� ���ǰ���: x1: %f\n', (-2*10) / (-5000.0 + 4999.9));
fprintf('2�� ���ǰ���: x2: %f\n', (-2*10) / (-5000.0 - 4999.9));