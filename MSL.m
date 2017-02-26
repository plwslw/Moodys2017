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
AcadiaMean=mean(Acadia,'omitnan');
Acadia(AcadiaEmpty)=AcadiaMean;

CapeHatterasEmpty=isnan(CapeHatteras);
CapeHatterasMean=mean(CapeHatteras,'omitnan');
CapeHatteras(CapeHatterasEmpty)=CapeHatterasMean;

KenaiFjordsEmpty=isnan(KenaiFjords);
KenaiFjordsMean=mean(KenaiFjords,'omitnan');
KenaiFjords(KenaiFjordsEmpty)=KenaiFjordsMean;

OlympicEmpty=isnan(Olympic);
OlympicMean=mean(Olympic,'omitnan');
Olympic(OlympicEmpty)=OlympicMean;

PadreIslandEmpty=isnan(PadreIsland);
PadreIslandMean=mean(PadreIsland,'omitnan');
PadreIsland(PadreIslandEmpty)=PadreIslandMean;



AcadiaYearlyChange=sumP(Acadia);
CapeHatterasYearlyChange=sumP(CapeHatteras);
KenaiFjordsYearlyChange=sumP(KenaiFjords);
OlympicYearlyChange=sumP(Olympic);
PadreIslandYearlyChange=sumP(PadreIsland);

time2=time;
time=time(12:end);

%numel(time)
%numel(AcadiaYearlyChange)

hold off
plot(time2,AcadiaYearlyChange,'y-o')
title('Annual Change in MSL versus Time')
xlabel('Time (years)')
ylabel('Annual Change in MSL (mm)')
legend('Acadia')
savefig('Acadia')
plot(time2,CapeHatterasYearlyChange,'m--+')
title('Annual Change in MSL versus Time')
xlabel('Time (years)')
ylabel('Annual Change in MSL (mm)')
legend('CapeHatteras')
savefig('CapeHatteras')
plot(time2,KenaiFjordsYearlyChange,'c:*')
title('Annual Change in MSL versus Time')
xlabel('Time (years)')
ylabel('Annual Change in MSL (mm)')
legend('KenaiFjords')
savefig('KenaiFjords')
plot(time2,OlympicYearlyChange,'r-..')
title('Annual Change in MSL versus Time')
xlabel('Time (years)')
ylabel('Annual Change in MSL (mm)')
legend('Olympic')
savefig('Olympic')
plot(time2,PadreIslandYearlyChange,'g-x')
title('Annual Change in MSL versus Time')
xlabel('Time (years)')
ylabel('Annual Change in MSL (mm)')
legend('Padre Island')
savefig('PadreIsland')

format long

write=[time, AcadiaYearlyChange, CapeHatterasYearlyChange, KenaiFjordsYearlyChange, OlympicYearlyChange, PadreIslandYearlyChange];
csvwrite('NatParks.csv',write)


