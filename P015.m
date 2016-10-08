function r = P015(N)
%Find number of routes through NxN grid.
if nargin<1; N=20; end
m=N+1; %Number of points in each direction of the grid.
a=zeros(m,m);a(m,:)=1;a(:,m)=1;a(m,m)=0; %Setting up the grid with 1s on far right/bottom, 0 in last element.
for i=N:-1:1;
    for j=i:-1:1; %j only needs to go up to i, since the solution matrix will be symmetrical. 
        a(i,j)=a(i+1,j)+a(i,j+1); %Starts from a(20,20) and adds the numbers below and to the right (since you can only move down/right).
        a(j,i)=a(i,j); %Then goes backwards along rows, and columns, adding these numbers.
    end; %a(1,1) will be the total # of routes to get from a(1,1) to a(21,21).
end;
r=a(1,1);
fprintf('Answer: %d\n',r);
end

%My reasoning for this is that from a(20,20) to a(21,21) there are two
%paths, down and right. From a(19,20) to a(21,21) there is the path to the
%right, or go down to a(20,20) where there are 2 paths. By going to the
%right there is only one path, straight down, therefore there are 3 paths
%from a(19,20) to a(21,21). Similarly, from a(18,20) to a(21,21) there are
%4 paths. This can be repeated all the way up to a(1,1), by adding the
%number of paths to the right and below.