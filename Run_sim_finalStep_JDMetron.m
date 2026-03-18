strart_date=0;
end_date=1060;
s0=100;
sigma=0.2;
k=110;
r=0.01;
num_paths=1000;

% n=[100,1000,5000,10000,15000,20000,25000,50000,60000,70000,100000,110000,12000];
%n=[130000,140000,150000,200000,210000];
% n=[250000,300000,350000,400000];
% n=[500000,600000];
% n=[100,1000000];
price=zeros(length(n),1);
for i=1:length(n)
price(i,1) = OptionPrice_JDMerton_sim_finalStep( strart_date,end_date, s0,k, sigma,r,n(i));
end
price