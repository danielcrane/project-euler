function [a A] = longadd(M,N)
%LONGADD(M,N) performs addition of two long numbers.
%   Inputs: M and N must both be strings.
%   Outputs: A is the string form of the answer, a is the array form.

i=max(length(M),length(N));I=abs(length(M)-length(N));l=ceil(i/14);

if ischar(M) ~= ischar(N); error('Inputs must be of same type.');
elseif ischar(M)==1;
    
    if i==length(M); x=[M;zeros(1,I) N]; x(2,1:I)='0';
    else x=[zeros(1,I) M;N]; x(1,1:I)='0';
    end
    
    for o=1:l;
        O1=1+14*(o-1); if 14*o>i;O2=i;else O2=14*o; end;
        a(O2)=sum(str2num(x(:,O1:O2)));
    end
    
    a=fliplr(a);
    
    
elseif ischar(M)==0;
    
    if i==length(M); x=[M;zeros(1,I) N];
    else x=[zeros(1,I) M;N];
    end
    
    a=sum(x(:,1:i));
    a=fliplr(a);
    
end
k=1;
while k<=length(a); %What this loop does is check through each element of 'a' separately, to make sure that they're digits.
    d=floor(log10(a(k))); %I do this so to check if it's a digit.
    while d>0;
        while length(a)<(k+d); a = [a zeros(1,d)]; end %This makes sure that the array is big enough to store any extra values for the next line.
        f=floor(a(k)/10^d);
        a(k+d)=a(k+d)+f; %This checks if a number is a digit, if not it moves numbers to the appropriate line, i.e. If it has 3 digits, it moves the first 2 rows along, and then the 2nd 1 row along in the next iteration of the loop.
        a(k)=a(k)-f*10^d; %This removes the value that's been moved along, i.e. 123 => 23 after this operation.
        d=d-1;
    end %This loop's repeated until there's a single digit left.
    k=k+1; %This moves along to the next value of a in order to check if it's a digit.
end

while isempty(a)==0;if a(length(a))==0; a(length(a))=[]; else break; end; end;
a=fliplr(a);

if nargout==2;
    for y=1:length(a)
        A(y)=num2str(a(y));
    end
end

end