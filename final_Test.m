function [ found ] = final_Test( m,r,c )
%m is pic
%r is the row the we want to chack
%c is the col the we want to chack
assert(r==c);
assert(0==mod(r,24));
assert(0==mod(c,24));
assert(ismatrix(m));

m=imresize(m,[r,c]);
found=0;
step=12;

%SVM to find face
isFace=[-7.6167  ,  1.7135  ,  2.6913];

while r > 24 && c >24
    %while the pic bigger then 24x24 we chack sub matrices
    for i=1 : step : r-23
        for j=1 :step : c-23
           
            [Fiture1,Fiture2,Fiture3,~]=find_Fitures(m(i:i+23,j:j+23,:));
            v=[Fiture1,Fiture2,Fiture3];
            v=double(v);
            
            %there is match
            if  v*(isFace)'> 0
                found=1;
                return
            end
        end
    end
    r=r-24;
    c=c-24;
    m=imresize(m,[r,c]);
end

%when we get to 24x24
[Fiture1,Fiture2,Fiture3,Fiture4]=find_Fitures(m);
v=[Fiture1,Fiture2,Fiture3];
v=double(v);

%if there is match and we have enough skin in the pic
if  v*(isFace)'> 0 && found==0 && Fiture4>20
    found=1;
end


end
