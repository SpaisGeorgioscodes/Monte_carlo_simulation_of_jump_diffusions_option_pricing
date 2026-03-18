function sim_pv = OptionPrice_GBM_sim_fullPath( strart_date,end_date, s0,k, sigma,r,num_paths)


% strart_date=0;
% end_date=1060;
% s0=100;
% sigma=0.2;
% k=110;
% r=0.01;
% num_paths=10000;

num_steps=end_date-strart_date;
dt=(end_date-strart_date)/(num_steps*252);
t=(end_date-strart_date)/(252);

sample=zeros(num_paths,  num_steps);
path_results=zeros(num_paths,5);

%paths creation
for i=1:num_paths
    sample(i,1)=s0;
    for j=2:num_steps
        sample(i,j)=sample(i,j-1)*exp((r-0.5*sigma*sigma)*dt+sigma*normrnd(0,1)*sqrt(dt));
    end
end

%path valuation
for i=1:num_paths
   path_results(i,1)=max(0, sample(i,end)-k);
end;

sim_pv=mean(path_results(:,1))*exp(-r*t)




end


