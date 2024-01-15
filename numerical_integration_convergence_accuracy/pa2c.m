format long
b=10000
f = @(x) sin(x)./x;
I1 = integral(f,0,b)
I2 = ((1/b)-(2/b.^3))*cos(b)+((1/b.^2)-(6/b.^4))*sin(b)
I1+I2
