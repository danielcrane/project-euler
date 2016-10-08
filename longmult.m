function A=longmult(X,Y)
%Inputs X and Y must be vectors of single-digit integers.
maxDigits=5;

Nx=numel(X);
xt=zeros(1,floor(Nx/maxDigits));
for i=1:floor(Nx/maxDigits)
    l=maxDigits*(i-1); xt(i)=sum(X(Nx-l-maxDigits+1:Nx-l).*10.^(maxDigits-1:-1:0));
end
Rx=rem(Nx,maxDigits);
if Rx~=0; xt(end+1)=sum(X(1:Rx).*10.^(Rx-1:-1:0)); end
X=xt;

if nargin==1; Y=X;
else
    Ny=numel(Y);
    yt=zeros(1,floor(Ny/maxDigits));
    for i=1:floor(Ny/maxDigits)
        l=maxDigits*(i-1); yt(i)=sum(Y(Ny-l-maxDigits+1:Ny-l).*10.^(maxDigits-1:-1:0));
    end
    Ry=rem(Ny,maxDigits);
    if Ry~=0; yt(end+1)=sum(Y(1:Ry).*10.^(Ry-1:-1:0)); end
    Y=yt;
end
clear xt yt l i;

Nx=numel(X); Ny=numel(Y);
At=zeros(1,Nx+Ny);
for i=1:Nx
    Xt=X(i)*Y;
    At(i:i+Ny-1)=At(i:i+Ny-1)+Xt;
end
At=fliplr(At);

for i=Nx+Ny:-1:1
    Fi=floor(At(i)/10^maxDigits);
    if Fi~=0;
        At(i-1)=At(i-1)+Fi;
        At(i)=mod(At(i),10^maxDigits);
    end
end

A=zeros(1,(Nx+Ny)*maxDigits);
for i=(Nx+Ny):-1:1
    A(i*maxDigits-maxDigits+1:i*maxDigits)=mod(floor(At(i)./10.^((maxDigits-1):-1:0)),10);
end
A=A(find(A,1,'first'):end);
end