%program to merge the individual absorption
%measurements into single arrays
iter=input('Enter the number of absorption measurements: ');
r=input('Enter which run this is: ');
if r == 1
        j=iter*5;
        k=1;
        dratio(1:j)=ones(1:j);
        ratio(1:j)=ones(1:j);
        h2(1:j)=ones(1:j);
        he(1:j)=ones(1:j);
        n2(1:j)=ones(1:j);
        L12CV(1:j)=ones(1:j);
        SAFB1(1:j)=ones(1:j);
        L12AV(1:j)=ones(1:j);
        L12BV(1:j)=ones(1:j);
        NOFlw(1:j)=ones(1:j);

        for i=1:iter:j
                s(k)=i;
                f(k)=(i+iter-1);
                k=k+1;
        end
        dratio(s(1):f(1))=dratio1;
        dratio(s(2):f(2))=dratio2;
        dratio(s(3):f(3))=dratio3;
        dratio(s(4):f(4))=dratio4;
        dratio(s(5):f(5))=dratio5;
%        dratio(s(6):f(6))=dratio6;

        ratio(s(1):f(1))=ratio1;
        ratio(s(2):f(2))=ratio2;
        ratio(s(3):f(3))=ratio3;
        ratio(s(4):f(4))=ratio4;
        ratio(s(5):f(5))=ratio5;
 %       ratio(s(6):f(6))=ratio6;

        h2(s(1):f(1))=h21;
        h2(s(2):f(2))=h22;
        h2(s(3):f(3))=h23;
        h2(s(4):f(4))=h24;
        h2(s(5):f(5))=h25;
 %       h2(s(6):f(6))=h26;

        he(s(1):f(1))=he1;
        he(s(2):f(2))=he2;
        he(s(3):f(3))=he3;
        he(s(4):f(4))=he4;
        he(s(5):f(5))=he5;
  %      he(s(6):f(6))=he6;

        n2(s(1):f(1))=n21;
        n2(s(2):f(2))=n22;
        n2(s(3):f(3))=n23;
        n2(s(4):f(4))=n24;
        n2(s(5):f(5))=n25;
   %     n2(s(6):f(6))=n26;

        L12CV(s(1):f(1))=L12CV1;
        L12CV(s(2):f(2))=L12CV2;
        L12CV(s(3):f(3))=L12CV3;
        L12CV(s(4):f(4))=L12CV4;
        L12CV(s(5):f(5))=L12CV5;
 %       L12CV(s(6):f(6))=L12CV6;

        SAFB1(s(1):f(1))=SAFB11;
        SAFB1(s(2):f(2))=SAFB12;
        SAFB1(s(3):f(3))=SAFB13;
        SAFB1(s(4):f(4))=SAFB14;
        SAFB1(s(5):f(5))=SAFB15;
  %      SAFB1(s(6):f(6))=SAFB16;

        L12AV(s(1):f(1))=L12AV1;
        L12AV(s(2):f(2))=L12AV2;
        L12AV(s(3):f(3))=L12AV3;
        L12AV(s(4):f(4))=L12AV4;
        L12AV(s(5):f(5))=L12AV5;
   %     L12AV(s(6):f(6))=L12AV6;
        
        L12BV(s(1):f(1))=L12BV1;
        L12BV(s(2):f(2))=L12BV2;
        L12BV(s(3):f(3))=L12BV3;
        L12BV(s(4):f(4))=L12BV4;
        L12BV(s(5):f(5))=L12BV5;

        NOFlw(s(1):f(1))=NOFlw1;
        NOFlw(s(2):f(2))=NOFlw2;
        NOFlw(s(3):f(3))=NOFlw3;
        NOFlw(s(4):f(4))=NOFlw4;
        NOFlw(s(5):f(5))=NOFlw5;
   %     NOFlw(s(6):f(6))=NOFlw6;

end

if r == 2
        j=iter*5;
        k=1;
        dratio(1:j)=ones(1:j);
        ratio(1:j)=ones(1:j);
        h2(1:j)=ones(1:j);
        he(1:j)=ones(1:j);
        n2(1:j)=ones(1:j);
        L12CV(1:j)=ones(1:j);
        SAFB1(1:j)=ones(1:j);
        L12AV(1:j)=ones(1:j);
        L12BV(1:j)=ones(1:j);
        NOFlw(1:j)=ones(1:j);

        for i=1:iter:j
                s(k)=i;
                f(k)=(i+iter-1);
                k=k+1;
        end
        dratio(s(1):f(1))=dratio6;
        dratio(s(2):f(2))=dratio7;
        dratio(s(3):f(3))=dratio8;
        dratio(s(4):f(4))=dratio9;
        dratio(s(5):f(5))=dratio10;
 %       dratio(s(6):f(6))=dratio12;

        ratio(s(1):f(1))=ratio6;
        ratio(s(2):f(2))=ratio7;
        ratio(s(3):f(3))=ratio8;
        ratio(s(4):f(4))=ratio9;
        ratio(s(5):f(5))=ratio10;
  %      ratio(s(6):f(6))=ratio12;

        h2(s(1):f(1))=h26;
        h2(s(2):f(2))=h27;
        h2(s(3):f(3))=h28;
        h2(s(4):f(4))=h29;
        h2(s(5):f(5))=h210;
   %     h2(s(6):f(6))=h212;

        he(s(1):f(1))=he6;
        he(s(2):f(2))=he7;
        he(s(3):f(3))=he8;
        he(s(4):f(4))=he9;
        he(s(5):f(5))=he10;
 %       he(s(6):f(6))=he12;

        n2(s(1):f(1))=n26;
        n2(s(2):f(2))=n27;
        n2(s(3):f(3))=n28;
        n2(s(4):f(4))=n29;
        n2(s(5):f(5))=n210;
  %      n2(s(6):f(6))=n212;

        L12CV(s(1):f(1))=L12CV6;
        L12CV(s(2):f(2))=L12CV7;
        L12CV(s(3):f(3))=L12CV8;
        L12CV(s(4):f(4))=L12CV9;
        L12CV(s(5):f(5))=L12CV10;
  %      L12CV(s(6):f(6))=L12CV12;

        SAFB1(s(1):f(1))=SAFB16;
        SAFB1(s(2):f(2))=SAFB17;
        SAFB1(s(3):f(3))=SAFB18;
        SAFB1(s(4):f(4))=SAFB19;
        SAFB1(s(5):f(5))=SAFB110;
  %      SAFB1(s(6):f(6))=SAFB112;

        L12AV(s(1):f(1))=L12AV6;
        L12AV(s(2):f(2))=L12AV7;
        L12AV(s(3):f(3))=L12AV8;
        L12AV(s(4):f(4))=L12AV9;
        L12AV(s(5):f(5))=L12AV10;
  %      L12AV(s(6):f(6))=L12AV12;

        L12BV(s(1):f(1))=L12BV6;
        L12BV(s(2):f(2))=L12BV7;
        L12BV(s(3):f(3))=L12BV8;
        L12BV(s(4):f(4))=L12BV9;
        L12BV(s(5):f(5))=L12BV10;

        NOFlw(s(1):f(1))=NOFlw6;
        NOFlw(s(2):f(2))=NOFlw7;
        NOFlw(s(3):f(3))=NOFlw8;
        NOFlw(s(4):f(4))=NOFlw9;
        NOFlw(s(5):f(5))=NOFlw10;
  %      NOFlw(s(6):f(6))=NOFlw12;

end

if r == 3
        j=iter*5;
        k=1;
        dratio(1:j)=ones(1:j);
        ratio(1:j)=ones(1:j);
        h2(1:j)=ones(1:j);
        he(1:j)=ones(1:j);
        n2(1:j)=ones(1:j);
        L12CV(1:j)=ones(1:j);
        SAFB1(1:j)=ones(1:j);
        L12AV(1:j)=ones(1:j);
        L12BV(1:j)=ones(1:j);
        NOFlw(1:j)=ones(1:j);

        for i=1:iter:j
                s(k)=i;
                f(k)=(i+iter-1);
                k=k+1;
        end
        dratio(s(1):f(1))=dratio11;
        dratio(s(2):f(2))=dratio12;
        dratio(s(3):f(3))=dratio13;
        dratio(s(4):f(4))=dratio14;
        dratio(s(5):f(5))=dratio15;
  %      dratio(s(6):f(6))=dratio18;

        ratio(s(1):f(1))=ratio11;
        ratio(s(2):f(2))=ratio12;
        ratio(s(3):f(3))=ratio13;
        ratio(s(4):f(4))=ratio14;
        ratio(s(5):f(5))=ratio15;
  %      ratio(s(6):f(6))=ratio18;

        h2(s(1):f(1))=h211;
        h2(s(2):f(2))=h212;
        h2(s(3):f(3))=h213;
        h2(s(4):f(4))=h214;
        h2(s(5):f(5))=h215;
  %      h2(s(6):f(6))=h218;

        he(s(1):f(1))=he11;
        he(s(2):f(2))=he12;
        he(s(3):f(3))=he13;
        he(s(4):f(4))=he14;
        he(s(5):f(5))=he15;
   %     he(s(6):f(6))=he18;

        n2(s(1):f(1))=n211;
        n2(s(2):f(2))=n212;
        n2(s(3):f(3))=n213;
        n2(s(4):f(4))=n214;
        n2(s(5):f(5))=n215;
  %      n2(s(6):f(6))=n218;

        L12CV(s(1):f(1))=L12CV11;
        L12CV(s(2):f(2))=L12CV12;
        L12CV(s(3):f(3))=L12CV13;
        L12CV(s(4):f(4))=L12CV14;
        L12CV(s(5):f(5))=L12CV15;
   %     L12CV(s(6):f(6))=L12CV18;

        SAFB1(s(1):f(1))=SAFB111;
        SAFB1(s(2):f(2))=SAFB112;
        SAFB1(s(3):f(3))=SAFB113;
        SAFB1(s(4):f(4))=SAFB114;
        SAFB1(s(5):f(5))=SAFB115;
   %     SAFB1(s(6):f(6))=SAFB118;

        L12AV(s(1):f(1))=L12AV11;
        L12AV(s(2):f(2))=L12AV12;
        L12AV(s(3):f(3))=L12AV13;
        L12AV(s(4):f(4))=L12AV14;
        L12AV(s(5):f(5))=L12AV15;
    %    L12AV(s(6):f(6))=L12AV18;
        
        L12BV(s(1):f(1))=L12BV11;
        L12BV(s(2):f(2))=L12BV12;
        L12BV(s(3):f(3))=L12BV13;
        L12BV(s(4):f(4))=L12BV14;
        L12BV(s(5):f(5))=L12BV15;

        NOFlw(s(1):f(1))=NOFlw11;
        NOFlw(s(2):f(2))=NOFlw12;
        NOFlw(s(3):f(3))=NOFlw13;
        NOFlw(s(4):f(4))=NOFlw14;
        NOFlw(s(5):f(5))=NOFlw15;
    %    NOFlw(s(6):f(6))=NOFlw18;

end

