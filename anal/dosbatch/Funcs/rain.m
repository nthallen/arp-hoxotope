function [zbin]=rainbow(x,y,z,zbin,symb,band)

% function [zbin]=rainbow(x,y,z,zbin,symb,band)
%
% This function produces a two-dimensional plot (x vs y) with a third axis (z) rendered
% in a rainbow of color.  The variable 'zbin' can be a scalar specifying the number of
% equally-spaced bins or a vector giving the bin limits.  The variable 'symb' is the plot
% symbol and use is identical to the standard plot command.  The variable 'band' ranges
% from 0 (no banding) to 1 (strong banding) and is typically set to 0.3.  Rainbow returns
% the vector zbin.  Created by P. Voss, 1998.
%
% Examples:
%		plotmax(x,y,z)
%		plotmax(x,y,z,6)
%		plotmax(x,y,z,3,'*',0.5)
%		plotmax(x,y,z,[10 20 30])

if exist('symb')~=1 symb='.'; end					% set default symbol

if exist('band')~=1										% set default banding
   band=0.3;
elseif band<0.0001
   band=0.0001;
elseif band>1
   band=1
end
f=1/band;

if exist('zbin')~=1 zbin=3; end						% set default bin number and limits
if length(zbin)==1									
   zmin=min(z);
   zmax=max(z);
   zbin=[zmin:(zmax-zmin)/zbin:zmax];
end
for i=1:length(zbin)-1 zleg(i)=zbin(i)/2+zbin(i+1)/2; end

ncolors=length(zbin)-1;
for i=1:ncolors		% single round of color wheel
   rgb(i,1)=interp1([0:1/3:1],[1 0 0 1],(i-1)/ncolors);
	rgb(i,2)=interp1([0:1/3:1],[0 1 0 0],(i-1)/ncolors);
	rgb(i,3)=interp1([0:1/3:1],[0 0 1 0],(i-1)/ncolors);
end

% CREATE PLOT
clf
hold on
for i=1:ncolors
   p=find(z>=zbin(i)&z<zbin(i+1));
   eval(['hsym=plot(x(p),y(p),''',symb,''');']);
   if i/2==fix(i/2)
      set(hsym,'Color',rgb(i,:)*(f-1)/f+1/f)
   else
      set(hsym,'Color',rgb(i,:)*(f-1)/f)
   end
end

% CREATE LEGEND
dh=0.04;
base_pntr=0.95-ncolors*dh;
['executing']
%a=axis; axis([-10 95 a(3) a(4)]); grid; xlabel('Latitude [deg]'); ylabel('Fractional Error')
a=axis; xmin=a(1); xmax=a(2); ymin=a(3); ymax=a(4); dx=xmax-xmin; dy=ymax-ymin;
x_pntr=xmin+0.1*dx;
for i=1:ncolors
   y_pntr=(base_pntr+i*dh)*dy+ymin;   
   eval(['hleg=text(',num2str(x_pntr),',',num2str(y_pntr),',''',num2str(zleg(i),'%4.3g'),''');']);
   if i/2==fix(i/2)
      set(hleg,'Color',rgb(i,:)*(f-1)/f+1/f)
   else
      set(hleg,'Color',rgb(i,:)*(f-1)/f)
   end
end
 

