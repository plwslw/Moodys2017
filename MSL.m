cla

sea_level=xlsread('NPS_MeanSeaLevel.xlsx',3,'A5:G244');

time=sea_level(:,1)+sea_level(:,2)/12;

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
Acadia(CapeHatterasEmpty)=CapeHatterasMean;

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

hold off
plot(time,AcadiaYearlyChange,'y-o')
legend('Acadia')
savefig('Acadia')
plot(time,CapeHatteras,'m--+')
legend('CapeHatteras')
savefig('CapeHatteras')
plot(time,KenaiFjords,'c:*')
legend('KenaiFjords')
savefig('KenaiFjords')
plot(time,Olympic,'r-..')
legend('Olympic')
savefig('Olympic')
plot(time,PadreIsland,'g-x')
legend('PadreIsland')
savefig('PadreIsland')


function out = yearlyChange(monthlyData);
out=zeros(numel(monthlyData),1);
for i=60:1:numel(monthlyData);
    pastYear=monthlyData(i-59:i);
    out(i)=sum(pastYear);
end
end
