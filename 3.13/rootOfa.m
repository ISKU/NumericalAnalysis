function x = rootOfa(e, a)
% input:
%   e = �ٻ簪�� ����
%   a = �Ǽ�
% output:
%   x = a�� ������

xold = 1; %�ʱⰪ
if a ~= 0
    while (1)
        xnew = (xold + abs(a)/xold) / 2;
        disp(xnew)
        enew = abs((xnew - xold) / xnew);
        disp(enew)
        xold = xnew;
        if enew <= e
            break; 
        end
    end
    if a < 0
        x = xold * 1i;
    else
        x = xold;
    end
else
    x = 0;
end

% rootOfa(1e-4, 0)
% rootOfa(1e-4, 2)
% rootOfa(1e-4, 10)
% rootOfa(1e-4, -4)