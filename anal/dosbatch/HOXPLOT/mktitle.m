% mktitle.m
% make a title string for matlab plots
  
function title_str=make_tstr(misc_str, m_file_str);
 
dnt=clock;
date_str=[int2str(dnt(2)),'-',int2str(dnt(3)),'-00'];                % date string
if     dnt(5)>=10; time_str=[int2str(dnt(4)),':',int2str(dnt(5))];   % time string
else;  time_str=[int2str(dnt(4)),':0',int2str(dnt(5))]; 
end;
title_str=[misc_str,'   (',date_str,', ',time_str,', ',m_file_str,')'];


