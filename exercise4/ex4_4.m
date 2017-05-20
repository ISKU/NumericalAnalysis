e = 1; 
% e: 1보다 더 큰 가장 작은 수
while(1)
    if 1+e <= 1 % 1+e가 1보다 작으면 e에 2배를 하고 반복문을 빠져 나온다.
        e = 2 * e;
        break;
    else
        e = e / 2;  % 1+e가 1보다 크면 반절로 나눈다.
    end
end
fprintf('e = %d\n', e); % e 값 출력

% 1보다 큰 가장 작은 수 e를 구하기 위해
% 1+e가 1보다 작으면 이미 e는 1보다 작기 때문에 e에 2배를 하고 반복문을 빠져나오고
% 1+e가 1보다 크면 아직 e는 1보다 큰 가장 작은수를 만들 수 있으므로 e를 반절로 나눈다.
% 반복문을 계속 수행하면 e는 1보다 크면서 계속 반절로 줄어들기 때문에
% 결국 1보다 큰 수중에서 가장 작은 수를 반환하게 된다.
% 알고리즘으로 구한 e와 내장함수 eps와 값이 같은 것을 알 수 있다.

% e = 2.220446e-16
% eps = 2.2204e-16