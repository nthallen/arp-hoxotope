% this file contains ross output as noted below;
% Use linear interpolation (modified version of linspl.m).
% rjwhatever=spline(tmjay,jwhatever,time), where tmjay=3600.*time2d(tmjay);
tmjay=3600.*time2d(altj);
%tmjay=3600.*time2d(tmjay);
rjo3all=spline(tmjay,jo3all,time);
rjo3o1d=spline(tmjay,jo1dmich,time);
rjno2_o=spline(tmjay,jno2_o,time);
rjh_hco=spline(tmjay,jh_hco,time);
rjh2_co=spline(tmjay,jh2_co,time);
rjh2o2=spline(tmjay,jh2o2,time);
rjno2=spline(tmjay,jno2,time);
rjhono=spline(tmjay,jhono,time);
rjhono2=spline(tmjay,jhono2,time);
rjhono3=spline(tmjay,jhono3,time);
rjclono2=spline(tmjay,jclono2,time);
rjcloocl=spline(tmjay,jcloocl,time);
rjhocl=spline(tmjay,jhocl,time);
rjbro=spline(tmjay,jbro,time);
rjbrono2=spline(tmjay,jbrono2,time);
rjhobr=spline(tmjay,jhobr_barnes,time);
rjhobr_rat=spline(tmjay,jhobr_rat,time);
albedo=spline(tmjay,jalbedo,time);
rjsza=spline(tmjay,jsza,time);

i=find(time<min(tmjay) | time>max(tmjay) | sza>94 | rjno2<0);
rjo3o1d(i)=nan.*ones(size(i));
rjh_hco(i)=nan.*ones(size(i));
rjh2_co(i)=nan.*ones(size(i));
rjh2o2(i)=nan.*ones(size(i));
rjno2_o(i)=nan.*ones(size(i));
rjno2(i)=nan.*ones(size(i));
rjhono(i)=nan.*ones(size(i));
rjhono2(i)=nan.*ones(size(i));
rjhono3(i)=nan.*ones(size(i));
rjclono2(i)=nan.*ones(size(i));
rjcloocl(i)=nan.*ones(size(i));
rjhocl(i)=nan.*ones(size(i));
rjhocl(i)=nan.*ones(size(i));
rjbro(i)=nan.*ones(size(i));
rjbrono2(i)=nan.*ones(size(i));
rjo3o1d(i)=nan.*ones(size(i));
rjhobr(i)=nan.*ones(size(i));
rjhobr_rat(i)=nan.*ones(size(i));


