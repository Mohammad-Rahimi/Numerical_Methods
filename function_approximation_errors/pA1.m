xx=[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
y=[5.176 15.471 45.887 96.5 47.448 19 11.692 12.382 17.846 21.703 16];
h=0.1
n=length(xx)
A=4*eye(n-2);
A(1,1)=6;
A(n-2,n-2)=6;
for i=2:length(xx)-3
A(i,i+1)=1;
A(i,i-1)=1;
end
for i=2:n-1
    yy(i-1)=(6/(h^2))*(y(i+1)-2*y(i)+y(i-1))
end
s=linsolve(A,yy');
aa=2*s(1)-s(2);
ee=2*s(n-2)-s(n-3);
ss=[aa; s(1:n-2); ee];
d=y(1:n-1);
b=ss(1:n-1)/2;
for i=1:n-1
a(i)=(ss(i+1)-ss(i))/(6*h);
c(i)=((y(i+1)-y(i))/h)-(2*h*ss(i)+h*ss(i+1))/6
end
a=a'
c=c'
d=d'
pp = spline(xx,y);
xi=linspace(0,1,1000);
coef=[a,b,c,d];
yi=ppval(pp,xi);
ppi=mkpp(xx,coef);
yii=ppval(ppi,xi);
plot(xi,yi,'color','green')
hold on
plot(xi,yii,'color','b')

