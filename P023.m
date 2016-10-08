function s = P023()
%Calculates sum of all positive integers that cannot be written as the sum of two abundant numbers.
maxN=28123;
abun=zeros(1,maxN);
for i=1:maxN
    f=1; %Start with 1 as a factor.
    for j=2:floor(sqrt(i)) %Go up to square root, as we'll cover the values about sqrt below.
        if j==sqrt(i); f=f+j;
        elseif rem(i,j)==0;
            f=f+j+i/j; %If it's a factor, add this factor and its pair (hence why we can stop at sqrt).
        end
    end
    if f>i;
        abun(i)=i;
    end
end

s=0;
for i=1:maxN
    f = abun(i-abun(1:i-1)); %Check if abun(i-previous abun) = abun.
    f(f==i)=0; %Can't be equal to self, as that means subtracted 0.
    if isempty(find(f, 1))
        s=s+i;
    end
end

fprintf('Answer: %d\n',s);

end