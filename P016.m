function s = P016(n)
%Calculates sum of digits of 2^n.

%bigpower is a code that uses exponentiation by squaring in order to 
%speed up calculation of large powers.
a = bigpower(2,n);
%The multiplication in bigpower is done using longmult, a custom function
%that performs multiplication of long numbers stored as arrays.
s = sum(a);
fprintf('Answer: %d\n',s);
end