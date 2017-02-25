function out = sumP(monthlyData)
out = zeros(1,numel(monthlyData));
for i=1:1:numel(monthlyData);
    out(i)=sum(monthlyData(1:i));
    
end
end

