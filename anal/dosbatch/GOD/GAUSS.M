% program to generate a gaussian line profile on the points in the
% vector position of
% full width half max gfwhm, at the position peak, of area height,
% x = gauss( gfwhm, peak, height, posit )

        function [x] = gauss ( gfwhm, peak, height, posit)

          pre = height*(1../gfwhm).*sqrt(4.*log(2.)/pi);
          xp  = -1*log(2)/((gfwhm/2).^2);
          x=posit-peak;
          x = pre.*exp(xp*(x.^2));
