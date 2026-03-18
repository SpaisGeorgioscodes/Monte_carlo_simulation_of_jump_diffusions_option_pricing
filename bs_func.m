function [ bs_pv] = bs_func( strart_date,end_date, s0,k, sigma,r,position)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% % position='put';
% % strart_date=0;
% % end_date=1060;
% % 
% % s0=100;
% % sigma=0.2;
% % k=100;
% % r=0.01;


if (strcmp(position,'call')) 
    trade_pos=1;
else
    trade_pos=-1;
end

t=(end_date-strart_date)/(252);




d1=(log(s0/k)+(r+0.5*sigma*sigma)*t)/(sigma*sqrt(t));
d2=d1-sigma*sqrt(t);

bs_pv=trade_pos*(normcdf(trade_pos*d1)*s0-normcdf(trade_pos*d2)*k*exp(-r*t));
end

