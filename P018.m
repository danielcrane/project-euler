function maxSum = P018()
load('P018.mat')

%This program uses a dynamic programming approach.
%Start from the last-1st row of the triangle, and find the best choice
%for each of these points to the two choices in the last row, summing them.
%Repeat this, moving up a row, until only one value is left.
for i=2:length(T);
    for j=1:i;
        if j==1; T(i,j)=T(i,j)+T(i-1,j); continue;
        elseif j==i; T(i,j)=T(i,j)+T(i-1,j-1); continue;
        end
        T(i,j)=T(i,j)+max(T(i-1,j),T(i-1,j-1));
    end
end

maxSum=max(T(length(T),:));
fprintf('Answer: %d\n',maxSum);
end