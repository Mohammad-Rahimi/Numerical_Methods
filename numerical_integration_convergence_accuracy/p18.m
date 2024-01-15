function F = myfun(x)
F(1) = x(1) + x(2) - 0.5;
F(2) = x(1)*x(3) + x(2)*x(4) - 1/3;
F(3) = x(1)*x(3)^2 + x(2)*x(4)^2 - 1/4;
F(4) = x(1)*x(3)^3 + x(2)*x(4)^3 - 1/5;

end
x0 = [0 0 0 0]; % initial guess
x = fsolve(myfun, x0);
disp(x);
