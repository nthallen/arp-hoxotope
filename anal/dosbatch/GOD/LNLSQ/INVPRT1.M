% MATLAB VERSION OF 2/27/93
% SUBPROGRAM OF INVERT1

   function [mat,err,mx,ik,jk,det] = invprt1(mat,dim,i1,mx,ik,jk,det);

% FIND LARGEST MATRIX ELEMENT
     for i2=i1:dim; for i3=i1:dim;
      if abs(mx) <= abs(mat(i2,i3)); mx=mat(i2,i3); ik(i1)=i2; ...
        jk(i1)=i3; end;
     end; end;

% CHECK MATRIX IS NONZERO
    if mx == 0, err=3; return, end
%
    i2=ik(i1)               ;
    if i2 > i1              ;
      for i3=1:dim          ;
       s1 = mat(i1,i3)      ;
       mat(i1,i3)=mat(i2,i3);
       mat(i2,i3)=-s1       ;
      end                   ;
    end                     ;
%
    if i2 >= i1
      i3=jk(i1)             ;
      if i3 > i1
        for i2=1:dim        ;
         s1 =mat(i2,i1)     ;
         mat(i2,i1)=mat(i2,i3);
         mat(i2,i3)=-s1       ;
        end
      end

      if i3 >= i1
        for i2=1:dim
          if i2 ~= i1
            mat(i2,i1)=-mat(i2,i1)./mx;
          end
        end

        for i2=1:dim; for i3=1:dim;
          if i1 ~= i2 &  i1 ~= i3
           mat(i2,i3)=mat(i2,i3)+mat(i2,i1)*mat(i1,i3);
          end
        end, end

        for i3=1:dim
         if i3 ~= i1
          mat(i1,i3)=mat(i1,i3)./mx                  ;
         end
        end
        mat(i1,i1)=1../mx          ;
        det=det*mx;

      else
       [mat,err,mx,ik,jk,det] = invprt1(mat,dim,i1,mx,ik,jk,det);
      end
    else
      [mat,err,mx,ik,jk,det] = invprt1(mat,dim,i1,mx,ik,jk,det) ;
    end
