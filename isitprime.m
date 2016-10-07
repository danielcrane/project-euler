function p = isitprime(n)
% Calculates whether or not input n is prime.
% Returns 1 if so, 0 if not.
p=1;

for i=2:floor(sqrt(n));
    if rem(n,i)==0; p=0; break; end
end

end