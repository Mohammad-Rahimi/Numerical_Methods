%composite 4 point Gauss Quadrature integration:
format long
b=1;
a=0;
n=[2,4,8,16,32,64,128,256,512];
%%%%%%%
t=[-0.861136311594052575224
-0.3399810435848562648027
0.3399810435848562648027
0.861136311594052575224];
%%%%%%%%%%%%%%
w=[0.3478548451374538573731
    0.6521451548625461426269
    0.6521451548625461426269
    0.3478548451374538573731];
for i=1:length(n)
GQ=[];
h=(b-a)/n(i);
nn=n(i);
for j=1:nn
    x1=(j-1)*h+a;
    x2=(j)*h+a;
    gg=0;
    for k=1:4
    gg=w(k)*f(((x2-x1)/2)*t(k)+((x1+x2)/2))+gg;
    end
    GQ(j)=gg*((x2-x1)/2);
end
I(i)=sum(GQ);   
end
syms x
expr = exp(-x.^2);
F = double(int(expr,[a b]));
err=F-I;
for i=1:length(I)-1
R(i)=err(i)/err(i+1);
end
t=table(n',I',err',[nan(), R]','VariableNames',["n","I(n)","error", "Ratio of error"])

function y=f(x)
y=exp(-x.^2);
%y=x.^(2.5);
%y = 1./(1+x.^2);
%y=1./(2+cos(x));
%y=exp(x).*cos(4*x);
end
