cla

sea_level=xlsread('NPS_MeanSeaLevel.xlsx',3,'A5:G244');

time=sea_level(:,1)+sea_level(:,2)/12.0;

Acadia=sea_level(:,3);
CapeHatteras=sea_level(:,4);
KenaiFjords=sea_level(:,5);
Olympic=sea_level(:,6);
PadreIsland=sea_level(:,7);

%replace un-known data with mean
AcadiaEmpty=isnan(Acadia);
AcadiaMean=mean(Acadia,'omitnan')
Acadia(AcadiaEmpty)=AcadiaMean;

CapeHatterasEmpty=isnan(CapeHatteras);
CapeHatterasMean=mean(CapeHatteras,'omitnan')
CapeHatteras(CapeHatterasEmpty)=CapeHatterasMean;

KenaiFjordsEmpty=isnan(KenaiFjords);
KenaiFjordsMean=mean(KenaiFjords,'omitnan')
KenaiFjords(KenaiFjordsEmpty)=KenaiFjordsMean;

OlympicEmpty=isnan(Olympic);
OlympicMean=mean(Olympic,'omitnan')
Olympic(OlympicEmpty)=OlympicMean;

PadreIslandEmpty=isnan(PadreIsland);
PadreIslandMean=mean(PadreIsland,'omitnan')
PadreIsland(PadreIslandEmpty)=PadreIslandMean;



AcadiaYearlyChange=yearlyChange(Acadia);
CapeHatterasYearlyChange=yearlyChange(CapeHatteras);
KenaiFjordsYearlyChange=yearlyChange(KenaiFjords);
OlympicYearlyChange=yearlyChange(Olympic);
PadreIslandYearlyChange=yearlyChange(PadreIsland);

time2=time
time=time(12:end);

%numel(time)
%numel(AcadiaYearlyChange)

hold off
plot(time,AcadiaYearlyChange,'y-o')
legend('Acadia')
savefig('Acadia')
plot(time,CapeHatterasYearlyChange,'m--+')
legend('CapeHatteras')
savefig('CapeHatteras')
plot(time,KenaiFjordsYearlyChange,'c:*')
legend('KenaiFjords')
savefig('KenaiFjords')
plot(time,OlympicYearlyChange,'r-..')
legend('Olympic')
savefig('Olympic')
plot(time,PadreIslandYearlyChange,'g-x')
legend('PadreIsland')
savefig('PadreIsland')

format long

write=[time, AcadiaYearlyChange, CapeHatterasYearlyChange, KenaiFjordsYearlyChange, OlympicYearlyChange, PadreIslandYearlyChange]
csvwrite('NatParks.csv',write)

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
