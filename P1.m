function s = P1(N)
%Calculates the sum of the multiples of 3 or 5 below N.
if nargin<1; N=1000; end
s=0;
for i=1:N-1
    if rem(i,3)==0 || rem(i,5)==0;
        s=s+i;
    end
end
fprintf('Answer: %d\n',s);
end