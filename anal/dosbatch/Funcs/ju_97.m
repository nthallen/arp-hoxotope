% this file contains APL output as noted below;
% Use linear interpolation (modified version of linspl.m).
% ajwhatever=interp1(tmu,jwhatever,time), where tmu=3600.*time2d(tmu);
tmu=time2d(tmu);
ajo3all=interp1(tmu,o3_3p_ju,time);
ajo3o1d=interp1(tmu,o3_o1d_ju,time);
ajo3above=interp1(tmu,o3_above_ju,time);
%ajno2_o=interp1(tmu,jno2_o,time);
ajh_hco=interp1(tmu,ch2o_h_ju,time);
ajh2_co=interp1(tmu,ch2o_h2_ju,time);
%ajh2o2=interp1(tmu,h2o2_ju,time);
ajno2=interp1(tmu,no2_ju,time);
%ajhono=interp1(tmu,hono_ju,time);
ajhono2=interp1(tmu,hono2_ju,time);
ajhono3=interp1(tmu,ho2no2_ju,time);
ajclono2=interp1(tmu,clo_no2_ju+cl_no3_ju,time);
ajcloocl=interp1(tmu,cl2o2_ju,time);
ajhocl=interp1(tmu,hocl_ju,time);
%ajbrono2=interp1(tmu,brono2_ju,time);
ajhobr=interp1(tmu,hobr_ju,time);
%ajalbedo=interp1(tmu,jalbedo,time);
%ajsza=interp1(tmu,jsza,time);

