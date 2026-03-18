function sim_pv = OptionPrice_JDMerton_sim_fullPath( strart_date,end_date, s0,k, sigma,r,num_paths)


% strart_date=0;
% end_date=1060;
% s0=100;
% sigma=0.2;
% k=110;
% r=0.01;
% num_paths=10000;
lamda=0.8;
% m=0.9;
% v=0.4;
% a=log(m^2/sqrt(v+m^2));
% b=log(v/(m^2)+1);

a=0.05;
b=0.15;
m=exp(b^2/2+a);  % mean of the lognormal distribution  
v=exp(2*a+b^2)*(exp(b^2)-1); % variance of the lognormal distribution  

num_steps=end_date-strart_date;
dt=(end_date-strart_date)/(num_steps*252);
t=(end_date-strart_date)/(252);

x=zeros(num_paths, num_steps);
%sample=zeros(num_paths, num_steps );
path_results=zeros(num_paths,5);

%paths creation
for i=1:num_paths
    x(i,1)=log(s0);
    M=0;
    N=0;
    for j=2:num_steps
         N=random('Poisson',lamda*dt);
        M=a*N+b*sqrt(N)*normrnd(0,1);
        x(i,j)=x(i,j-1)+(r-lamda*(m-1)-0.5*sigma*sigma)*dt+sigma*normrnd(0,1)*sqrt(dt)+M;
        
    end
end
sample=exp(x);
%path valuation
for i=1:num_paths
   path_results(i,1)=max(0, sample(i,end)-k);
end;

sim_pv=mean(path_results(:,1))*exp(-r*t);




end


