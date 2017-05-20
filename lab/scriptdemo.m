%scriptdemo.m
g=9.81; 
m=68.1;
cd=0.25;
t=12;

v=sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t)
% 세미콜론X -> 결과 디스플레이