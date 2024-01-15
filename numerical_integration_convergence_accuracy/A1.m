format long
f = @(x) (1/(2-sqrt(2)))*exp(x.^(1/(2-sqrt(2))));
I = integral(f,0,1)
