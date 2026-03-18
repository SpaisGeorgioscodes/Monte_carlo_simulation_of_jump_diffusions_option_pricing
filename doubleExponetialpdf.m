function f = doubleExponetialpdf(y,h1,h2,p )
n=length(y);
f=y;
for i=1:n
    if(y(i)>=0)
    f(i)=p*h1*exp(-y(i)*h1);
    
       else
    f(i)=(1-p)*h2*exp(y(i)*h2);
       end
    
    
    
end



end

