
function [ anser ] = isSkin(Center)
assert(ismatrix(Center));
Center=double(Center);
w=[15.1314 , -26.0521 ,  10.4939];

anser=-1;
a = [Center(1,1,1),Center(1,1,2),Center(1,1,3)];
b = [Center(1,2,1),Center(1,2,2),Center(1,2,3)];
c = [Center(2,1,1),Center(2,1,2),Center(2,1,3)];
d = [Center(2,2,1),Center(2,2,2),Center(2,2,3)];
if((a*w'>0 && c*w'>0 )||( b*w'>0 && d*w'>0) )
    anser=1;
end
if((a*w'>0 && b*w'>0 )||( c*w'>0 && d*w'>0) )
    anser=1;
end

end