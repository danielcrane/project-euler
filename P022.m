function FinalScore = P022()
%First load names, because delimiter on importdata doesn't seem to work.
Names_temp=importdata('names.txt');
Names_temp=Names_temp{1};
NameScores=[];

[tempstr,remain]=strtok(Names_temp);
score_temp=double(tempstr)-64;

NameRank(1,1)=sum(score_temp.*10.^-(0:2:2*length(score_temp)-2));
NameScores(1)=sum(score_temp);

k=2;
while ~isempty(remain);
    [tempstr,remain]=strtok(remain); %Could use importdata then strsplit instead.
    score_temp=double(tempstr)-64;
    L=length(score_temp);
    for ii=1:ceil(L/6);
        StartLim=(ii-1)*6+1;
        if ii==ceil(L/6); EndLim=L; else EndLim=StartLim+6; end
        ST=score_temp(StartLim:EndLim);
        NameRank(k,ii)=sum(ST.*10.^-(0:2:2*length(ST)-2)); %Some long names causing underflow.
    end
    
    NameScores(k)=sum(score_temp);
    k=k+1;
end

[NameRank,ind_change]=sortrows(NameRank,[1 2]);
NameScores=NameScores(ind_change);
fprintf('Now calculating Final Score.\n');
FinalScore=0;
for i=1:size(NameScores,2);
    FinalScore=FinalScore+i*NameScores(i);
end
fprintf('Answer: %d\n',FinalScore);
end