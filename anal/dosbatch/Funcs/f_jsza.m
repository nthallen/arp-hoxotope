function j=f_jsza(sza,jmax,f,tau);

% function j=f_jsza(sza,jmax,f,tau);
%
% This program uses a semi-physical model to estimate j-values from sza.
% Three parameters can be adjusted to fit the model to the data.  From a plot
% of j-value vs sza, jmax and f can be read immediately. The denominator of f
% is the sza where the j-value reaches zero, while j-max is the average j-value
% at sza=0 (provided there is adequate data in this region) Once jmax and f are
% established, tau can be used to tune the curvature.  Lowering tau produces
% sharper transitions and a more box-like j-value vs sza plot.  Raising tau
% rounds the function.  Created by P. Voss, 1998.

j=zeros(1,length(sza));
n=find(sza<=90/f);
j(n)=jmax*exp(tau*(1-1./cos(sza(n)*pi/180*f)));


%JCLONO2_FIT=f_jsza(abs(SZA),6.9e-5,.945,0.21);
%JNO2_FIT=f_jsza(abs(SZA),1.35e-2,.965,0.11);
%JO1D_FIT=f_jsza(abs(SZA),8e-5,.85,2.2);
%JHNO3_FIT1=f_jsza(abs(SZA),1.25e-6,.945,2.75);
%JHNO3_FIT2=f_jsza(abs(SZA),.53e-6,.93,0.375);