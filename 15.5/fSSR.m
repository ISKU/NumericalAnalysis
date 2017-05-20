function f = fSSR(a, xm, ym)
yp = a(1)*xm.^a(2); % 비선형 모델
f = sum((ym-yp).^2); % 제곱합을 계산하기 위한 목적 함수

% 목적 함수
% fminsearch로부터 p1, p2, ...의 변수들이 넘겨진다.