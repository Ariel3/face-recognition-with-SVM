function [bestC,errorV,w,maxM,minM] = SVM( Mtest,tags,c )


maxM=[max(Mtest(:,1)),max(Mtest(:,2)),max(Mtest(:,3))];
minM=[min(Mtest(:,1)),min(Mtest(:,2)),min(Mtest(:,3))];
[ Mtest ] = normalization( Mtest, maxM, minM );

cross_validation = 5; 
errorV=zeros(1,length(c));
sum_Error=0;
for i=1:1: length(c)
    
    for j=1:1:cross_validation 
        % Mix and split 100% to 70% and 30%
    [ testing_Mtest,real_Mtest,testing_tags,real_tags ]= split_matrix_and_tags(Mtest,tags);
    % Learning
    w=stochastic_gradient_decent(testing_Mtest,testing_tags,c(i));
    % How wrong can i bee
    sum_Error=sum_Error+Error(real_Mtest,real_tags,w);
    end
    
errorV(i)=sum_Error/cross_validation;
sum_Error=0;
end

[~,newC]=min(errorV);
bestC=c(newC);
w=stochastic_gradient_decent(Mtest,tags,bestC);
end

