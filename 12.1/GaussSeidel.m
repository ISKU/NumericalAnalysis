function x = GaussSeidel(A,b,es,maxit)
% input:
%   A = ���簢���
%   b = �캯����
%   es = ������� ���� (default = 0.00001%)
%   maxit = �ִ� �ݺ� Ƚ�� (default = 50)
% output:
%   x = ��

if nargin<2,error('at least 2 input arguments required'),end
if nargin<4||isempty(maxit),maxit=50;end
if nargin<3||isempty(es),es=0.00001;end
% �Է��� 2�� �̻��̿��� �Ѵ�. (A��İ� �캯����)
% es�� ������� ������ �Է����� ���� �� 0.00001�� �ʱ�ȭ
% maxit�� �ݺ�Ƚ���� �Է����� ���� �� 50���� �ʱ�ȭ

[m,n] = size(A);    % m,n�� A����� ũ��
if m~=n, error('Matrix A must be square'); end % A�� ���簢����̾�� �Ѵ�.
C = A;

for i = 1:n
  C(i,i) = 0;
  x(i) = 0;
end
% C�� x�� ��� ���Ҹ� 0���� �ʱ�ȭ ( �ʱⰪ 0 )

x = x';
for i = 1:n
  C(i,1:n) = C(i,1:n)/A(i,i);
end
for i = 1:n
  d(i) = b(i)/A(i,i);
end
% 3x3 ������������ �ظ� ���ϱ� ���� ������ ���� �����Ͽ�
% �ʱⰪ 0���� ���� ù��° �ظ� ���Ѵ�.

iter = 0;
while (1)
  xold = x;
  for i = 1:n
    x(i) = d(i)-C(i,:)*x;
    if x(i) ~= 0
      ea(i) = abs((x(i) - xold(i))/x(i)) * 100;
    end
  end
  % ù��°�� ������ �ط� ���� ������ؿ��� �Ǵ� �ִ�ݺ�Ƚ���� ������ ������
  % ������ �Ŀ� ������ ���� �ظ� �����Ͽ� �ظ� ���Ѵ�.
  
  iter = iter+1;    % �ݺ�Ƚ�� ����
  if max(ea)<=es || iter >= maxit, break, end % �������
end
