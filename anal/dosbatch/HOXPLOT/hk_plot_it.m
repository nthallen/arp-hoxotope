% PLOT_IT.m, adapted from Rick Stimpfle's housekeeping plotting routine plt_all3.m
% Created 10/1/1999

pos_ax1=[.10 .71 .8 .21];
pos_ax3=[.10 .50 .8 .21];
pos_ax5=[.10 .29 .8 .21];
pos_ax7=[.10 .08 .8 .21];

f=figure; clf; orient tall;
set(f,'position',[200 30 600 500],'units','pixels')
% set(f,'PaperPosition',[1 1 6.5 9]) 

% Axis #1
ax(1)=axes('position',pos_ax1);
%ax(1)=newplot;
%set(ax(1),'position',pos_ax1);
f1_1=plot(x,y1,'b-');
set(ax(1),'box','off','Yaxislocation','left','Xaxislocation','top') 
set(ax(1),'XTickLabel','')
set(ax(1),'Position',pos_ax1)

axis([min(x) max(x) (ymin(1)-0.1*(ymax(1)-ymin(1))) (ymax(1)+0.1*(ymax(1)-ymin(1)))]);
% eliminate top YTickLabel
%if y3flag==1;
%dum = get(ax(3),'YTickLabel')
%[r c]=size(dum)
%dum(r,:)=(' '.*ones(1,c));
%set(ax(3),'YTickLabel',dum)
%end;

if nogrid==1; else; grid; end;
ylabel(label1)
title_str=mktitle(['FLIGHT: ',fltdate_str,'  ',int2str(I)],'HOUSEKEEP, LOAD IT, PLOT IT.m');
title([title_str]);


% Axis #2
ax(2)=axes('position',get(ax(1),'position'));
f1_2=plot(x,y2,'r:');
set(ax(2),'box','off','Yaxislocation','right','Xaxislocation','bottom') 
set(ax(2),'color','none','xgrid','off','ygrid','off');
set(ax(2),'XTickLabel','')
set(ax(2),'Position',pos_ax1)

axis([min(x) max(x) (ymin(2)-0.1*(ymax(2)-ymin(2))) (ymax(2)+0.1*(ymax(2)-ymin(2)))]);
ylabel(label2)


% Axis #3
ax(3)=axes('position',pos_ax3);
f1_3=plot(x,y3,'b-');
set(ax(3),'box','off','Yaxislocation','left','Xaxislocation','top') 
set(ax(3),'XTickLabel','')
set(ax(3),'Position',pos_ax3)

axis([min(x) max(x) (ymin(3)-0.1*(ymax(3)-ymin(3))) (ymax(3)+0.1*(ymax(3)-ymin(3)))]);
ylabel(label3)
if nogrid==1; else; grid; end;


% Axis #4
ax(4)=axes('position',get(ax(3),'position'));
f1_4=plot(x,y4,'r:');
set(ax(4),'box','off','Yaxislocation','right','Xaxislocation','bottom') 
set(ax(4),'color','none','xgrid','off','ygrid','off');
set(ax(4),'XTickLabel','')
set(ax(4),'Position',pos_ax3)

axis([min(x) max(x) (ymin(4)-0.1*(ymax(4)-ymin(4))) (ymax(4)+0.1*(ymax(4)-ymin(4)))]);
ylabel(label4)


% Axis #5
ax(5)=axes('position',pos_ax5);
f1_5=plot(x,y5,'b-');
set(ax(5),'box','off','Yaxislocation','left','Xaxislocation','top') 
set(ax(5),'XTickLabel','')
set(ax(5),'Position',pos_ax5)

axis([min(x) max(x) (ymin(5)-0.1*(ymax(5)-ymin(5))) (ymax(5)+0.1*(ymax(5)-ymin(5)))]);
ylabel(label5)
if nogrid==1; else; grid; end;


% Axis #6
ax(6)=axes('position',get(ax(5),'position'));
f1_6=plot(x,y6,'r:');
set(ax(6),'box','off','Yaxislocation','right','Xaxislocation','bottom') 
set(ax(6),'color','none','xgrid','off','ygrid','off');
set(ax(6),'XTickLabel','')
set(ax(6),'Position',pos_ax5)

axis([min(x) max(x) (ymin(6)-0.1*(ymax(6)-ymin(6))) (ymax(6)+0.1*(ymax(6)-ymin(6)))]);
ylabel(label6)


% Axis #7
ax(7)=axes('position',pos_ax7);
f1_7=plot(x,y7,'b-');
set(ax(7),'box','off','Yaxislocation','left','Xaxislocation','top') 
set(ax(7),'XTickLabel','')
set(ax(7),'Position',pos_ax7)

axis([min(x) max(x) (ymin(7)-0.1*(ymax(7)-ymin(7))) (ymax(7)+0.1*(ymax(7)-ymin(7)))]);
ylabel(label7)
if nogrid==1; else; grid; end;


% Axis #8
ax(8)=axes('position',get(ax(7),'position'));
f1_8=plot(x,y8,'r:');
set(ax(8),'box','off','Yaxislocation','right','Xaxislocation','bottom') 
set(ax(8),'color','none','xgrid','off','ygrid','off');
%set(ax(8),'XTickLabel','')
set(ax(8),'Position',pos_ax7)

axis([min(x) max(x) (ymin(8)-0.1*(ymax(8)-ymin(8))) (ymax(8)+0.1*(ymax(8)-ymin(8)))]);
xlabel('GMT (sec)')
ylabel(label8)
