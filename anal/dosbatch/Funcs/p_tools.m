%  p_tools.m     useful plotting utilities

set(0,'defaultaxeslinewidth',2);
set(0,'defaultaxesfontsize',14);
set(0,'defaultaxesfontname','timesnewroman');
grid; axis([0 350 0 3500]);
xlabel('N_2O (ppb)','FontSize',13,'FontName','timesnewroman'); 
ylabel('Cl_y species (ppt)','FontSize',13,'FontName','timesnewroman' )
today
title(['Flight: ',fd_str,'         Analysis: ',ad_str],'FontSize',14,'FontName','timesnewroman')
legend(h,'clo','cln','hcl','total','t-cly')
hold off;

title(['Flight: ', makestr1(flt_day(1)) ]);


text(V(1)+(abs(V(2)-V(1))*0.05),V(4)*0.25,'HO_x');

h=plot(x(i),y(i)); grid;
set(h,'LineWidth',1.5);

x=[1:1:10];

figure(1); clf; orient portrait;
h=plot(x,x,'.');
set(h,'MarkerSize',30);
set(h,'XGrid',on);



 b=uicontrol('Style','pushbutton', ... 
            'units','normalized', ...
               'position', [.9 .1 .2 .1], ...
               'string', 'on', ...
               'callback','grid on'); 
 c=uicontrol('Style','pushbutton', ... 
            'units','normalized', ...
               'position', [.9 .9 .2 .1], ...
               'string', 'clear', ...
               'callback','play2');

% better way to provide a title
tt=clock;
dstr=[int2str(tt(2)),'-',int2str(tt(3)),'-98'];
tstr=[int2str(tt(4)),':',int2str(tt(5))];
title_str=[str2,'  Flt:',str1,'        (',dstr,' ',tstr,' tracer1.m)'];

