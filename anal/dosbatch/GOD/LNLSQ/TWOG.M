% function two genrate the sum of two gaussians with a linear baseline

  function[calc] = model (m1,m2,m3,m4,pa)
        xa=gauss(pa(5),pa(1),pa(2),m1);
%        xb=gauss(pa(5),pa(1)+pa(3),pa(2)/3,m1);
       xb=gauss(pa(5)+pa(6),pa(1)+pa(3),pa(4),m1);
        base=ones(1:length(m1))';
        base=base*pa(7);
        calc=xa+xb+base;
