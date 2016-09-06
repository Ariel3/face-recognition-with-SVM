function [Fiture1,Fiture2,Fiture3,Fiture4] = find_Fitures(m)
assert(ismatrix(m));

row_Index=zeros(1,1);
col_Index=zeros(1,1);
suming_sub_M=zeros(1,1);

for i=9:12
    for j=6:14
        %select sub matrix to catch the eyes area
        sub_matrix=m(i:i+1, j:j+5, :);
        
        
        Left_eye = sub_matrix(1:2, 1:2, :);
        Center = sub_matrix(1:2, 3:4, :);
        Right_eye = sub_matrix(1:2, 5:6, :);
        if sum_Matrix(Center) > sum_Matrix(Left_eye)
            
            if sum_Matrix(Center) > sum_Matrix(Right_eye)
                
                if sum_Matrix(Left_eye)-sum_Matrix(Right_eye) < 1
                    
                    if isSkin(Center) > 0
                        %we take all the subs matrix who has eyes
                        suming_sub_M=[suming_sub_M,sum_Matrix(sub_matrix)];
                        row_Index=[row_Index,i];
                        col_Index=[col_Index,j];
                    end
                end
            end
        end
        
    end
    
end

%delete the first element (0)
suming_sub_M(1)=[];
row_Index(1)=[];
col_Index(1)=[];

%avarge of all the optional eyes
Fiture1=int16(mean(suming_sub_M));

row_nose = int16(mean(row_Index)) + 2;
col_nose = int16(mean(col_Index)) + 2;

Fiture2 = sum_Matrix(m(row_nose:row_nose+1, col_nose:col_nose+1, :));
Fiture3 = sum_Matrix(m(row_nose+3, col_nose-1:col_nose+2, :));
Fiture1 = ceil(Fiture1/3);

%if we cant find eyes in the pic
%we set all the Fiture's to the center
if Fiture1==0
    Fiture1=sum_Matrix(m(9:10,6:11,:));
    Fiture2=sum_Matrix(m(11:12,8:9,:));
    Fiture3=sum_Matrix(m(12,5:8,:));
    
end
% SVM of skin
w = [15.1314 , -26.0521 ,  10.4939];

%get the occurrence of skin in the pic
pic_size=24;
count=0;

for i=1:pic_size
    for j=1:pic_size
        v=[m(i,j,1),m(i,j,2),m(i,j,3)];
        v=double(v);
        if v*w'>0
            count=count+1;
        end
    end
end

Fiture4=count/(pic_size*pic_size);
end

