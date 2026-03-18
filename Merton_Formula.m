strart_date=0;
end_date=1060;
s0=100;
sigma=0.2;
k=110;
r=0.01;
position='call';
t=(end_date-strart_date)/(252);
lamda=0.8;
 a=0.05;   %mean
b=0.15;   %sd
m=exp(b^2/2+a);  % mean of the lognormal distribution 

v=exp(2*a+b^2)*(exp(b^2)-1); % variance of the lognormal distribution  
n=30;
f2=0;
for i=0:n
%     p=1;
    si=sqrt(sigma^2+((b^2)*i)/t);
    ri=r-lamda*(m-1)+i*log(m)/t;
%     f0=exp(-lamda*m*t)*bs_func( strart_date,end_date, s0,k, sigma,r-lamda*(m-1),position);
     f1=f2+exp(-lamda*m*t)*(((lamda*(m)*t)^i)/(factorial(i)))*bs_func( strart_date,end_date, s0,k, si,ri,position);
     f2=f1;
     
    
end
f=f1

