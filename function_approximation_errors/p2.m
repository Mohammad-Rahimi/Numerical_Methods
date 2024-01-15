x=[	0.1	0.2	0.4	0.6	0.9	1.3	1.5	1.7	1.8];
y=[	0.75	1.25	1.45	1.25	0.85	0.55	0.35	0.28	0.18];
for i=1:length(x);
z(i)=y(i)/x(i);
end
A(:,2)=x';
A(:,1)=1;
b=log(z)
b=b'
X=inv(A'*A)*A'*b;
plot(x,b,'o')
hold on 
box on
xx=linspace(0.1,1.8,1000);
yy=X(1)+X(2)*xx;
plot(xx,yy);
xlabel("x");
ylabel("log(y/x)");
legend('data','least square model');
