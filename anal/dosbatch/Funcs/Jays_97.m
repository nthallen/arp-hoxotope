% this file contains ross output as noted below;
% Use linear interpolation (modified version of linspl.m).
% rjwhatever=interp1(tmjay,jwhatever,time), where tmjay=3600.*time2d(tmjay);
tmjay=time2d(tmjay);
rjo3all=interp1(tmjay,jo3all,time);
rjo3o1d=interp1(tmjay,jo3_Mich,time);
rjo3above=interp1(tmjay,jo3above,time);
%rjno2_o=interp1(tmjay,jno2_o,time);
rjh_hco=interp1(tmjay,jh_hco,time);
rjh2_co=interp1(tmjay,jh2_co,time);
%rjh2o2=interp1(tmjay,jh2o2,time);
rjno2=interp1(tmjay,jno2,time);
%rjhono=interp1(tmjay,jhono,time);
rjhono2=interp1(tmjay,jhono2,time);
rjhono3=interp1(tmjay,jhono3,time);
rjhno4_350=interp1(tmjay,jhno4_350,time);
rjhno4_don=interp1(tmjay,jhno4_Don,time);
rjclono2=interp1(tmjay,jclo_no2+jcl_no3,time);
rjcloocl=interp1(tmjay,jcloocl,time);
rjhocl=interp1(tmjay,jhocl,time);
%rjbro=interp1(tmjay,jbro,time);
rjbrono2=interp1(tmjay,jbrono2,time);
rjhobr=interp1(tmjay,jhobr,time);
%rjhobr_rat=interp1(tmjay,jhobr_rat,time);
rjalbedo=interp1(tmjay,jalbedo,time);
%rjsza=interp1(tmjay,jsza,time);


