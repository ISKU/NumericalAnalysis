function v = freefallvel(t, m, cd)

%freefallvel: bungee velocity with second-order drag
%v=freefallvel(t,m,cd) computes the free-fall velocity
% of an object with second-order drag
%input:
%t=time(s)
%m=mass(kg)
%cd=second order drag coefficient (kg/m)
%output:
%v=downward velocity (m/s)

g=9.81; %accelearation of gravity
v=sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t);

% help freefallvel 
% %코멘트문 출력

% ex> 사용예
%>> freefallvel(12, 68.1, 0.25) ans = 50.6175
%>> freefallvel(8, 100, 0.25) ans = 53.1878 