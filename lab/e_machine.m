eps = 1;
while(1)
    if 1+eps <= 1
        eps = 2 * eps;
        break;
    else
        eps = eps / 2;
    end
end
fprintf('%d\n', eps);