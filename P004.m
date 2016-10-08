function p=P004(n)
% Find the largest palindrome made from the product of two n-digit numbers.
if nargin<1; n=3; end
p=0;
for i=(10^n)-1:-1:10^(n-1);
    for j=i:-1:10^(n-1)
        I=i*j;
        if I<p; break; end
        s=digit(I);
        S=fliplr(s);
        if sum(abs(S-s))==0;
            p=I;
            break;
        end
    end
end
fprintf('Answer: %d\n',p);
end