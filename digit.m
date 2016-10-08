function I = digit(i)
%DIGIT Either breaks down a number i into its digits,
% combines an array of digits into a number.
% or turns a string into an array of digits.
%   Input: i, an integer.
%   Output: I, an array containing the digits of i.
%
%   Input: i, an array of numbers.
%   Output: I, an integer made by flattening i.
%
%   Input: i, a string containing a number.
%   Output: I, an array containing the digits of i.

if isscalar(i)==1;
    
    i_l=floor(log10(i))+1;
    I=zeros(1,i_l);
    
    for j=1:i_l
        I(j)=floor(i/10^(i_l-j));
        i=i-I(j)*10^(i_l-j);
    end
    
elseif ischar(i)
    i_l=length(i);
    I=zeros(1,i_l);
    for j=1:i_l
        I(j)=single(i(j))-48;
    end
    
elseif isvector(i)==1;
    I=0;
    for n=1:length(i)
        I=I+i(n)*10^(length(i)-n);
    end
    
end