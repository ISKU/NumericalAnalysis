function x = Tridiag(e, f, g, r)
% Tridiag(e, f, g, r):
%    Tridiagonal system solver
% input:
%   e = subdiagonal vector (e1은 0으로 채운다)
%   f = diagonal vector
%   g = superdiagonal vector
%   r = right hand side vector
% output
%   x = solution vector

n = length(f);
% 전진소거
for k = 2:n
    factor = e(k)/f(k-1); % 피봇과 소거할 행의 나눗셈 과정
    % 삼중대각행렬은 소거할 행의 값이 e와 f로만 연산이 이루어진다.
    f(k) = f(k) - factor*g(k-1);    
    % 피봇과 피봇행의 바로 아래의 행을 소거과정
    r(k) = r(k) - factor*r(k-1);  
    % 피봇행 바로 아래 행의 r 값 소거과정
end

% 후진대입
disp(f); disp(r);   % 전진소거후 f의 값과 r의 값 확인
x(n) = r(n)/f(n);   % 전진소거로 만들어진 가장 마지막 행의 해를 구함
for k = n-1:-1:1
    x(k) = (r(k) -g(k)*x(k+1)) / f(k);
    % 바로 직전의 행에서 구한 해를 이용하여 해당 행의 해를 구함
    % 순수 가우스소거와는 다르게 전진 소거후 남는 값은 f와 g부분이기 때문에
    % 연산과정이 더욱 간단한다.
end
