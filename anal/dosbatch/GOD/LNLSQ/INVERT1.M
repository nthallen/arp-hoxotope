% MATLAB VERSION OF 2/27/93
% INVERT1 COMPUTES THE INVERSE OF MAT AND RETURNS IT AND THE
% DETERMINANT; IT FIRST THE LARGEST ELEMENTS OF ANY COLUMN
% ON THE DIAGONAL AND THE DIVIDES AND ADDS TO ZERO THE OTHER
% ELEMENTS IN THE STANDARD INVERSION ALGORITHM
   function [mat,det,err] =  invert1(mat,dim)      ;

   det=1.                                          ;
   ik=zeros(1,dim)                                 ;
   jk=zeros(1,dim)                                 ;

 for i1=1:dim;
    mx=0.                                         ;
    [mat,err,mx,ik,jk,det] = invprt1(mat,dim,i1,mx,ik,jk,det);

    if err == 3, return, end                       ;
 end

% ORDER MATRIX IN ORIGINAL WAY
%
  for i4=1:dim
   i1=dim-i4+1              ;
   i3=ik(i1)                ;
   if i3 > i1
     for i2=1:dim
      s1 =mat(i2,i1)        ;
      mat(i2,i1)=-mat(i2,i3);
      mat(i2,i3)=s1         ;
     end
   end
   i2=jk(i1)                ;
   if i2 > i1
     for i3=1:dim
      s1=mat(i1,i3)        ;
      mat(i1,i3)=-mat(i2,i3);
      mat(i2,i3)=s1         ;
  end; end; end;
   err=0;
