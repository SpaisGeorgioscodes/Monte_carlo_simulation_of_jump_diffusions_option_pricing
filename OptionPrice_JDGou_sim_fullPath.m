function sim_pv = OptionPrice_JDGou_sim_fullPath( strart_date,end_date, s0,k, sigma,r,num_paths)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

%
lamda=0.8;
p=0.4;
h1=7;
h2=10;
m=p*h1/(h1-1)+(1-p)*h2/(h2+1);
%
num_steps=end_date-strart_date;
dt=(end_date-strart_date)/(num_steps*252);
t=(end_date-strart_date)/(252);
path_results=zeros(num_paths,5);

x=zeros(num_paths, num_steps);
%paths creation
for i=1:num_paths
    x(i,1)=log(s0);
  for j=2:num_steps
       N=random('Poisson',lamda*dt);
%         M=0;
       M1=0;
       if (N==0)
           M=0;
           
       else
           i1=1;
           while i1<=N
           s=random('bino',1,p);  
           
           if (s==1)
               lnV=random('exp',1/h1);
           else
               lnV=-random('exp',1/h2);
               
           end
           M=M1+lnV;
           M1=M;
           i1=i1+1;
           end
           
       end
       x(i,j)=x(i,j-1)+(r-lamda*(m-1)-0.5*sigma*sigma)*dt+sigma*normrnd(0,1)*sqrt(dt)+M;
       
  end
end;
    
%     
% kkkkkkkkkkkkkkkkk
sample=exp(x);

%path valuation
for i=1:num_paths
   path_results(i,1)=max(0, sample(i,end)-k);
end;

sim_pv=mean(path_results(:,1))*exp(-r*t);




end

