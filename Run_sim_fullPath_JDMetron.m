strart_date=0;
end_date=1060;
s0=100;
sigma=0.2;
k=110;
r=0.01;
num_paths=200;

 sim_pv = OptionPrice_JDMerton_sim_fullPath( strart_date,end_date, s0,k, sigma,r,num_paths)
