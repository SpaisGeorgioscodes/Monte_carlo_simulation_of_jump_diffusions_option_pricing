function sim_pv = OptionPrice_JDMerton_sim_finalStep( strart_date,end_date, s0,k, sigma,r,num_paths)


% strart_date=0;
% end_date=1060;
% s0=100;
% sigma=0.2;
% k=110;
% r=0.01;
% num_paths=10000;
lamda=0.8;

a=0.05;
b=0.15;
m=exp(b^2/2+a);  % mean of the lognormal distribution  
v=exp(2*a+b^2)*(exp(b^2)-1); % variance of the lognormal distribution  

num_steps=end_date-strart_date;
dt=(end_date-strart_date)/(num_steps*252);
t=(end_date-strart_date)/(252);

x=zeros(num_paths,1);
sample=zeros(num_paths, 1);
path_results=zeros(num_paths,1);

%paths creation
for i=1:num_paths
     M=0;
      N=0;
     N=random('Poisson',lamda*t);
      M=a*N+b*sqrt(N)*normrnd(0,1);
      x(i,1)=log(s0)+(r-lamda*(m-1)-0.5*sigma*sigma)*t+sigma*normrnd(0,1)*sqrt(t)+M;
        
    
end
sample=exp(x);
%path valuation
for i=1:num_paths
   path_results(i,1)=max(0, sample(i,end)-k);
end;

sim_pv=mean(path_results(:,1))*exp(-r*t);




end


