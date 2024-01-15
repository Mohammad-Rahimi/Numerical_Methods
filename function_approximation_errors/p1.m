xx=[0 1 2 2.5 3 4];
y=[1.4 0.6 1 0.65 0.6 1];
%xx=[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
%y=[5.176 15.471 45.887 96.5 47.448 19 11.692 12.382 17.846 21.703 16];
h = diff(xx);
yyy= diff(y)
n=length(xx)
A(1,1)=((h(1)+h(2))*(h(1)+2*h(2)))/h(2);
A(1,2)=((h(2)^2)-(h(1)^2))/h(2);
A(n-2,n-2)=((h(n-1)+h(n-2))*(h(n-1)+2*h(n-2)))/h(n-2);
A(n-2,n-3)=((h(n-2)^2)-(h(n-1)^2))/h(n-2);
for i=2:n-3
A(i,i+1)=h(i+1);
A(i,i-1)=h(i);
A(i,i)=2*(h(i+1)+h(i))
end
for i=1:n-2
    yy(i)=(6)*(yyy(i+1)/h(i+1)-yyy(i)/h(i))
end
s=linsolve(A,yy');
aa=(1+h(1)/h(2))*s(1)-(h(1)/h(2))*s(2);
ee=(1+h(n-1)/h(n-2))*s(n-2)-(h(n-1)/h(n-2))*s(n-3);
ss=[aa; s(1:end); ee];
d=y(1:n-1);
b=ss(1:n-1)/2;
for i=1:n-1
a(i)=(ss(i+1)-ss(i))/(6*h(i));
c(i)=((y(i+1)-y(i))/h(i))-(2*h(i)*ss(i)+h(i)*ss(i+1))/6
end
a=a'
c=c'
d=d'
pp = spline(xx,y);
xi=linspace(0,4,1000);
coef=[a,b,c,d];
yi=ppval(pp,xi);
ppi=mkpp(xx,coef);
yii=ppval(ppi,xi);
plot(xi,yi,'color','green')
hold on
plot(xi,yii,":")
