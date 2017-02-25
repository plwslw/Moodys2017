function out = yearlyChange(monthlyData);
out=zeros(numel(monthlyData),1);
for i=60:1:numel(monthlyData);
    pastYear=monthlyData(i-59:i);
    out(i)=sum(pastYear);
end
end