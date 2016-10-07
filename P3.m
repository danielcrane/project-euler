function F=P3(n)
% Calculates the largest prime factor of n.
if nargin<1; n=600851475143; end
F=[];

if isitprime(n)==1; F(2)=n;
else
    for i=2:floor(sqrt(n));
        if rem(n,i)==0 && isitprime(i)==1;
            F(length(F)+1)=i;
        end
    end
end
fprintf('Answer: %d\n',F(end));
end