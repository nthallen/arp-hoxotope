% calculate OH using Ross's data
% Chexk to see that hoxss_n.m has same
% chemistry as Ross.
rat_sp=ho2oh(tmm_sp,o3_sp,no_sp,co_sp,clo_sp,bro_sp,pmm_sp);
[ohc_sp ho2c_sp phv_sp po1d_sp loh_sp lho2_sp]=hoxss_sp(ch4_sp,h2o_sp,hcl_sp,oh_sp,rat_sp,...
   o1d_sp,cl_sp,no2_sp,2.*hno3_sp,hno4_sp,h2co_sp,jhno3_97,jhno4_97,jh_hco_97,m_sp,tmm_sp,jhobr_sp,hobr_sp,bro_sp);
