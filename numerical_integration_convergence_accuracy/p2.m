% simpson integration:
format long
b=1;
a=0;
n=[2,4,8,16,32,64,128,256,512,1024,2048];
for i=1:length(n)
h=(b-a)/n(i);
nn=n(i);
x=linspace(a,b,n(i)+1);
y=f(x);
simps(i) = (y(1)+4*sum(y(2:2:nn))+2*sum(y(3:2:nn-1))+y(nn+1))*(h/3);
x=[];
y=[];
end
for j=1:length(n)-2
R(j)=(simps(j+1)-simps(j))/(simps(j+2)-simps(j+1));
end
%%%%%%% doing extrapolation:
for i=1:length(simps)-2
    Ix1(i)=(R(i)*simps(i+2)-simps(i+1))/(R(i)-1);
end
for j=1:length(Ix1)-2
Rx1(j)=(Ix1(j+1)-Ix1(j))/(Ix1(j+2)-Ix1(j+1));
end
for i=1:length(Ix1)-2
    Ix2(i)=(Rx1(i)*Ix1(i+2)-Ix1(i+1))/(Rx1(i)-1);
end
for j=1:length(Ix2)-2
Rx2(j)=(Ix2(j+1)-Ix2(j))/(Ix2(j+2)-Ix2(j+1));
end
t=table(n',simps',[nan(),nan(),R]',[nan(),nan(),Ix1,]',[nan(),nan(),nan(),nan(),Rx1]','VariableNames',["n","I(n)","R(n)","Iextrap","R of extrap"])

function y=f(x)
%y=exp(-x.^2);
y=x.^(2.5);
%y = 1./(1+x.^2);
%y=1./(2+cos(x));
%y=exp(x).*cos(4*x);
end
