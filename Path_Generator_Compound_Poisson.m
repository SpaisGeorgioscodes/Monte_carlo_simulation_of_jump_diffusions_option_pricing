
strart_date=0;
end_date=1060;
lamda=10;
num_paths=5;
a=1;
b=3;

num_steps=end_date-strart_date;
dt=(end_date-strart_date)/(num_steps*252);
t=(end_date-strart_date)/(252);

sample=zeros(num_paths, num_steps);
%paths creation
for i=1:num_paths
    sample(i,1)=0;
    for j=2:num_steps
         N=random('Poisson',lamda*dt);
        M=a*N+b*sqrt(N)*normrnd(0,1);
        sample(i,j)=sample(i,j-1)+M;           
    end
end

time=zeros(1, num_steps);
time(1,1)=0;
for i=2:num_steps
    time(1,i)=(i-1)*dt;
end;


for i=1:num_paths
    plot(time(1,:), sample(i,:), 'color',rand(1,3));
    hold on;
end
hold off
