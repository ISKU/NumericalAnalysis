function xb = incsearch(func, xmin, xmax, ns)
% func: 근을 찾기 위한 함수
% xmin: x의 최소 범위
% xmax: x의 최대 범위
% ns: x의 범위에서 구간의 수

if nargin < 3, error('at least 3 arguments required'), end
% 함수 입력이 3개 미만일 경우 에러메시지를 보냄 (func, xmin, xmax는 필수 입력)
if nargin < 4, ns = 50; end
% 함수 입력이 4개 미만일 경우 ns의 값을 자동으로 50으로 설정함

x = linspace(xmin, xmax, ns); % 입력받은 x의 범위 (xmin ~ xmax)
f = func(x); % x의 범위를 입력받은 함수 func에 대입하여 나타낸 함수 f
nb = 0; xb = []; 
% nb: 구간안에서 찾은 근의 개수
% xb: 상한과 하한의 경계값, 즉 근이 있는 구간이 배열 xb에 저장된다

for k = 1:length(x)-1 % k=1부터 x의 길이(ns)-1까지 1씩 증가 시켜 반복문 수행
    if sign(f(k)) ~= sign(f(k+1)) 
    % 근의 양쪽에서 부호가 다른지 검사한다.
    % 즉, f(k)에서 f(k+1)이 서로 부호가 다르면 그 사이에 근이 존재 하는 것
        nb = nb + 1;    % 근을 찾음, 찾은 근의 개수 1증가
        xb(nb, 1) = x(k);   
        xb(nb, 2) = x(k+1); 
        % nb x 2의  xb 배열에 서로 반대대는 부호에 대해 x값을 1, 2번째에 저장
    end
end % k가 length(x)-1 보다 크면 반복문 종료

if isempty (xb) % xb가 null인 경우, 즉 근을 찾지 못함
    disp('no brackets found')
    disp('check interval or increase ns')
else % xb가 null이 아닌 경우, 찾은 근의 개수 nb를 나타냄
    disp('number of brackets:')
    disp(nb)
end
