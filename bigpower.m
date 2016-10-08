function a = bigpower(b,p)
%BIGPOWER(B,P) calculates large powers of the number b to power p.
%   Outputs: [a,A] where a is array form, and A is string form.

p_b=fliplr(num2str(dec2bin(p))); %I use dec2bin since I'm using binary exponentiation.
i=find(p_b=='1')-1;
nMax=[i(1) diff(i)];

a=1; a_t=b;
for m=1:length(i)
    for n=1:nMax(m)
        a_t=longmult(a_t); %longmult is custom-built function that multiplies large numbers in array form.
    end
    a=longmult(a,a_t);
end

end

%http://en.wikipedia.org/wiki/Addition-chain_exponentiation
%http://en.wikipedia.org/wiki/Exponentiation_by_squaring