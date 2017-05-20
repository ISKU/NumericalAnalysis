function [x, fx, ea, iter] = goldmin(f, xl, xu, es, maxit, varargin)
% input
% f: 함수
% xl: 초기 하한값
% xu: 초기 상한값
% es: 종료조건 근사오차
% maxit: 최대 반복횟수

% output
% x: 최소값
% fx: 최소값에서의 참값
% ea: 근사오차
% iter: 반복횟수

if nargin < 3, error('at least 3 input arguments required'), end
if nargin < 4 || isempty(es), es=0.0001; end
if nargin < 5 || isempty(maxit), maxit=50; end
% 함수, 하한, 상한 최소 3개 입력이 필요
% 3개 이하 입력시 종료조건 근사오차는 0.0001로 초기화
% 4개 이하 입력시 최대 반복횟수는 50회로 초기화

phi = (1+sqrt(5))/2;    % 황금비
iter = 0;   % 반복횟수

while(1)
    d = (phi-1)*(xu-xl);
    x1 = xl + d;
    x2 = xu - d;
    % d는 두개의 중간점이 황금비에 따라 선택되기 위한 식
    % 최소값의 발생 여부를 알기 위한 x1, x2은 두 개의 중간 함수값이다
    
    if f(x1, varargin{:}) < f(x2, varargin{:})
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
    iter = iter +1;
    % 반복횟수 증가
    
    if xopt ~= 0, ea = (2-phi) * abs((xu-xl) / xopt) * 100; end
    if ea <= es || iter >= maxit, break, end
    % 현재 근사오차를 ea를 구하고
    % 종료기준 근사오차보다 현재 근사오차가 작거나,
    % 최대 반복횟수가 현재 반복횟수를 넘으면 반복을 종료한다.
end
x = xopt; fx=f(xopt, varargin{:});
% x는 최소값, fx는 x에서의 참값
