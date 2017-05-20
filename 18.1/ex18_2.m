%data
xi = [ 3.0 4.5 7.0 9.0 ];
fi = [ 2.5 1.0 2.5 0.5 ];
hi = [ 1.5 2.5 2.0 ];

% 각 점의 2차 스플라인 함수를 구하기 위한 조건식
% 1.5 * b(1) = 1.0 - 2.5
% 2.5 * b(2) + 2.5^2 * c(2) = 2.5 - 1.0
% 2.0 * b(3) + 2.0^2 * c(3) = 0.5 - 2.5
% b(1) = b(2)
% b(2) + 2 * 2.5 * c(2) = b(3)

% 위 식을 행렬롤 만들면 다음과 같다.

A = [ 1.5 0 0 0 0; 0 2.5 6.25 0 0; 0 0 0 2 4; 1 -1 0 0 0; 0 1 5 -1 0 ];
b = [ -1.5; 1.5; -2; 0; 0];

x = A\b
