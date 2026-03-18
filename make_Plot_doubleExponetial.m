y=-1:0.01:1;
f=zeros(length(y),1);
h1=5;
h2=10;
p=0.4;
for i=1:length(y)
 f(i,1) = doubleExponetialpdf(y(i),h1,h2,p );
end
plot(y,f(:,1))