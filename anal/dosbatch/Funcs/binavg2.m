% binavg1.m 
% function [xavg,yavg, xyeb, yyeb, xxeb, yxeb, Nbin]=binavg(x,y,bin_number,fig_number, V);
% from an x-y plot, no outlyiers, average into equal size x-axis bins, 
% the x axis plot size defines the bins, take care how you plot 
% bin_number is the number of bins 
% fig_number is the figure to draw
% define the error bars within binavg1.m

function [xavg,yavg, xyeb, yyeb, xxeb, yxeb, Nbin]=binavg(x,y,bin_number,fig_number, V);
today; figure(fig_number); clf; orient tall;  % plot of the original data to be binned
subplot(2,1,1);  h1=plot(x,y,'b.'); grid; axis(V);
set(h1,'MarkerSize',8)  

binsize=(V(2)-V(1))/bin_number;

for i=1:bin_number+1;                 %////////////// define bin boundaries
s=num2str(i); s2=num2str(i-1);
eval(['xbound',s,'=V(1) + binsize*',s2,';']);
end

Nbin=[1:bin_number]*nan;
for i=1:bin_number;                   %///////////////// find indices for each bin
s=num2str(i); s2=num2str(i+1);
% i1= find (x>=xbound1 & x<xbound2);
% Nbin(1) = legnth(i1);
eval(['i',s,'=find(x>=xbound',s,' & x<xbound',s2,');']); 
eval(['Nbin(',s,') = length(i',s,');']); end;

xavg=[1:bin_number]*nan; yavg=[1:bin_number]*nan;
for i=1:bin_number;                   %//////////////// find means
s=num2str(i);
% xavg(1)=mean(x(i1)); yavg(1)=mean(y(i1));
eval(['xavg(',s,')=mean(x(i',s,'));']); eval(['yavg(',s,')=mean(y(i',s,'));']); end;

xsd=[1:bin_number]*nan; ysd=[1:bin_number]*nan;
xsdom=[1:bin_number]*nan; ysdom=[1:bin_number]*nan;
for i=1:bin_number;               %/////////////////// find sdom
s=num2str(i);
% [xsd(1), xsdom(1)] = sd_fun( x(i1),xavg(1) );
eval(['[xsd(',s,'),xsdom(',s,')]=sd_fun(x(i',s,'),xavg(',s,'));']);
eval(['[ysd(',s,'),ysdom(',s,')]=sd_fun(y(i',s,'),yavg(',s,'));']); end

xxeb=ones([bin_number,2])*nan; xyeb=ones([bin_number,2])*nan; 
yxeb=ones([bin_number,2])*nan; yyeb=ones([bin_number,2])*nan;
for i=1:bin_number;                 %///////////////// define error bar vectors
s=num2str(i);
% choose sdom or sd for error bars below, i.e., ysd or ysdom  
% xyerb is the x coordinates of the y (vertical error bar)
% yyerb is the y coordinates of the y (vertical error bar)
eval(['xyeb(',s,',:)= [xavg(',s,') xavg(',s,')];']); 
eval(['yyeb(',s,',:)=[yavg(',s,')+ysd(',s,')*1  yavg(',s,')-ysd(',s,')*1];']);
eval(['yxeb(',s,',:)=[yavg(',s,') yavg(',s,')];']); 
eval(['xxeb(',s,',:)=[xavg(',s,')+xsd(',s,')*1  xavg(',s,')-xsd(',s,')*1];']); end

%////////////////////////////////////////////////////////////////
subplot(2,1,2); h2=plot(xavg,yavg,'bo'); grid; hold on;
set(h2,'MarkerSize',8);

for i=1:bin_number;
s=num2str(i);
%plot(xyeb(1,:),yyeb(1,:),'k')
eval(['h2=plot(xyeb(',s,',:),yyeb(',s,',:),''b'',xxeb(',s,',:),yxeb(',s,',:),''b'');']);
set(h2,'LineWidth',2); end;   %was 1.5
%axis(V);
V1=axis; axis([V(1) V(2) V(3) V(4)]);  
% x11=[V(1) V(2)]; h=plot(x11,x11,'k');     % optional 1-to-1 line 

h2=plot(xavg,yavg,'ko'); 
set(h2,'MarkerSize',8);


hold off
