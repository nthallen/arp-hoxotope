%  sd_fun.m      c:\matlab\rates
% function [sd,sdom] = sd_fun(x,xm);
% find standard deviation and standard deviation of the mean

function [sd, sdom] = sd_fun(x,xm);

N=length(x);
sd = (   sum((x-xm).^2.0) ./ (N-1)   ).^0.5;
sdom = sd / N^0.5;