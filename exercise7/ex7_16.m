function [x, fx, iter] = ex7_16(f, xl, xu, ead)
% input
% f: 함수
% xl: 초기 하한값
% xu: 초기 상한값
% ead: 허용 오차

% output
% x: 최소값
% fx: 최소값에서의 참값
% iter: 반복횟수

phi = (1+sqrt(5))/2;    % 황금비
iter = ceil(log2((xu-xl)*(2-phi)/ead)/log2(phi));   % 반복횟수

for n=1:iter
    d = (phi-1)*(xu-xl);
    x1 = xl + d;
    x2 = xu - d;
    % d는 두개의 중간점이 황금비에 따라 선택되기 위한 식
    % 최소값의 발생 여부를 알기 위한 x1, x2은 두 개의 중간 함수값이다
    
    if f(x1) < f(x2)
        xopt = x1;
        xl = x2;
        % f(x1)이 최소이므로 x2의 왼쪽 영역은 최소값이 없기 때문에 버린다.
        % xl부터 x2의 왼쪽 영역을 버리고 x2는 다음 반복의 xl이 된다.
    else
        xopt = x2;
        xu = x1;
        % (fx2)가 최소이므로 x1의 오른쪽 영역은 최소값이 없기 때문에 버린다.
        % xl부터 xu까지 x1의 오른쪽 영역을 버리고 x1은 다음 반복의 xu가 된다.
    end
end
x = xopt; fx=f(xopt);
% x에서의 최소값
