function smooth_data=smooth(data,data_pts)
% smooth.m function to utilize the filter
% function.  Use input data_pts to determine
% filter inputs.
b=ones(1,data_pts)./data_pts;
smooth_data=filter(b,1,data);