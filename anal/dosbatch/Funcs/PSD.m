% PSD.m
% Script to subtract zeros and calculate X and Y
% Positions of GrnPSD
% Some zero drift!!
% X1Las when BmPsMux=0
xl=find(BmPsMux==0);
xl_north_0=min(BmPsN(xl));
xl_south_0=min(BmPsS(xl));
xl_east_0=min(BmPsE(xl));
xl_west_0=min(BmPsW(xl));
xl_north=BmPsN(xl)-xl_north_0;
xl_south=BmPsS(xl)-xl_south_0;
xl_east=BmPsE(xl)-xl_east_0;
xl_west=BmPsW(xl)-xl_west_0;
xl_total=xl_north+xl_south+xl_east+xl_west;
% X1LAS PSD oriented such that x=N-S and y=E-W
xl_x=(xl_north-xl_south)./(xl_north+xl_south);
xl_y=(xl_east-xl_west)./(xl_east+xl_west);
xl_uv=UVMon(xl);

% GrnP when BmPsMux=1
dl=find(BmPsMux==1);
dl_north_0=min(BmPsN(dl));
dl_south_0=min(BmPsS(dl));
dl_east_0=min(BmPsE(dl));
dl_west_0=min(BmPsW(dl));
dl_north=BmPsN(dl)-dl_north_0;
dl_south=BmPsS(dl)-dl_south_0;
dl_east=BmPsE(dl)-dl_east_0;
dl_west=BmPsW(dl)-dl_west_0;
dl_total=dl_north+dl_south+dl_east+dl_west;
% GrnP PSD oriented such that x=N-S and y=W-E
dl_x=(dl_north-dl_south)./(dl_north+dl_south);
dl_y=(dl_west-dl_east)./(dl_east+dl_west);
dl_uv=UVMon(dl);

