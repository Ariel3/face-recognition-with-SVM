s='faces\image_0';

for i=111:200
s=strcat(s,int2str(i));
s=strcat(s,'.jpg');
a=imread(s);
find_face(a);
s='image_0';
end