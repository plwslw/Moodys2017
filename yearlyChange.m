function out = yearlyChange(monthlyData);
months=12;
%out=zeros(numel(monthlyData)-months+1, 1);
pnts=numel(monthlyData)- months + 1
out=zeros(pnts,1)
for i=months:1:numel(monthlyData);
    pastYear=monthlyData(i-months+1:i);
    out(i-months+1)=sum(pastYear);
end
end