% this file contains APL output as noted below;
% Use linear interpolation (modified version of linspl.m).
% ajwhatever=interp1(tmu,jwhatever,time), where tmu=3600.*time2d(tmu);
tmu=time2d(tmu);
ajo3all=interp1(tmu,o3_3p_jv,time);
ajo3o1d=interp1(tmu,o3_o1d_jv,time);
ajo3above=interp1(tmu,o3_above_jv,time);
%ajno2_o=interp1(tmu,jno2_o,time);
ajh_hco=interp1(tmu,ch2o_h_jv,time);
ajh2_co=interp1(tmu,ch2o_h2_jv,time);
%ajh2o2=interp1(tmu,h2o2_jv,time);
ajno2=interp1(tmu,no2_jv,time);
%ajhono=interp1(tmu,hono_jv,time);
ajhono2=interp1(tmu,hono2_jv,time);
ajhono3=interp1(tmu,ho2no2_jv,time);
ajclono2=interp1(tmu,clo_no2_jv+cl_no3_jv,time);
ajcloocl=interp1(tmu,cl2o2_jv,time);
ajhocl=interp1(tmu,hocl_jv,time);
%ajbrono2=interp1(tmu,brono2_jv,time);
ajhobr=interp1(tmu,hobr_jv,time);
%ajalbedo=interp1(tmu,jalbedo,time);
%ajsza=interp1(tmu,jsza,time);


