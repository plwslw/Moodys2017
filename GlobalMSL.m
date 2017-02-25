Data = csvread('globalMSL.csv');
ds = mat2dataset(Data);
ds.Properties.VarNames= {'Time', 'SeaLevelVariation'};
Time_Years =double(ds(:,1))
Sea_Level_Milimeters =double(ds(:,2))

ds2=YearlyChange(double(ds))

%csvwrite('GlobalTrend.csv',ds2)

timeG=ds2(:,1)
GlobalSeaLevel=ds2(:,2)

function out = YearlyChange(data)
timeMin=data(1,1)
i=1
while data(i,1)-timeMin<1
    i=i+1
end
tmin=i
out=zeros(length(data)-i+1,2)
while i<=length(data)
    j=i
    while data(i,1)-data(j,1)<1
        j=j-1
    end
    out(i+1-tmin,1)=data(i,1)
    out(i+1-tmin,2)=data(i,2)-data(j,2)
    i=i+1
end
end
        