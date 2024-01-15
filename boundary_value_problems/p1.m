format long
a=0;
b=2;
h=0.1;
x=a:h:b;
y0=1
yn=5
%% making the tridiagonal matrix
for i=2:length(x)-1
    A(i-1)=-(2-c(x(i))*h^2);
    B(i-1)=1-(h/2)*bb(x(i));
    C(i-1)=1+(h/2)*bb(x(i))  ;
end
AA=zeros(length(x)-2);
for i=1:length(A)
    AA(i,i)=A(i);
end
for i=1:length(A)-1
    AA(i,i+1)=C(i);
    AA(i+1,i)=B(i+1);
end
%% making the d vector:
for i=2:length(x)-1
    d(i-1)=DD(x(i))*(h^2);
end
%% applying BC:
d(1)=d(1)-B(1)*y0;
d(end)=d(end)-C(end)*yn;

AA
d=d'
yy=linsolve(AA,d)

function y=c(x)
y=-(1-(x./4));
end
function y=bb(x)
y=0;
end
function y=DD(x)
y=x;
end

