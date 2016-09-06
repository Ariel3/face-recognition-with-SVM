%we take folder of face/not face and tags them
%and build the data set for the SVM

fileID = fopen('False.txt','w');
Tags=1;


srcFiles = dir('C:\Users\Student\Desktop\New folder\*.jpg'); % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat('C:\Users\Student\Desktop\New folder\',srcFiles(i).name);
    m = imread(filename);
    
[Fiture1,Fiture2,Fiture3,~] = find_Fitures(m);

fprintf(fileID,'%d\t%d\t%d\t%d\n',Fiture1,Fiture2,Fiture3,Tags);
end
fclose(fileID);