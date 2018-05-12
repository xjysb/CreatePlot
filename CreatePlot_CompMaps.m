% DATABASE_A:
% H	Ma Tse Wf VSV
% W2 BPR beta_fanc beta_fand beta_booster
% beta_comp	PR_hpt PR_lpt Nl Nh
% EGT P3s PR Etot WcF
% PRF SMF WcB PRB SMB
% WcC PRC SMC

% Result:
% Time ? ? ? ?
% ? ? ? ? N_1
% N_2 T_{45} Ps_3 EPR ?
% ? ? ? ? ?
% ? ? ? u_r1 u_r2
% W_f ? S ?

load Result.mat;
load DATABASE_A.mat;
x1 = [ Result(15,:); Result(18,:); Result(21,:) ];
y1 = [ Result(16,:); Result(19,:); Result(22,:) ];
dp = [ DATABASE_A(2,20:21); DATABASE_A(2,23:24); DATABASE_A(2,26:27) ];

subplot( 2,2,1 )
n_tab = MCP.Fan_exduct.N_tab;
eff_tab = MCP.Fan_exduct.Eta_tab;
wc_tab = MCP.Fan_exduct.Wcor_tab;
pr_tab = MCP.Fan_exduct.Pi_tab;
ssline = DATABASE_A(2:3,20:21);

hold on;
box on;
grid on;
[C,h] = contour( wc_tab, pr_tab, eff_tab );
clabel(C,h,'LabelSpacing',100);

plot( wc_tab', pr_tab', 'Color', [0.8 0.8 0.8],'DisplayName','speed lines (N_c)' );
plot( MCP.Fan_exduct.WcSurgeVec, MCP.Fan_exduct.PRSurgeVec,'DisplayName','stall line','MarkerSize',3,'Marker','o', 'LineWidth',2, 'Color', [0.8,0.8,0.8]  );
plot( x1(1,:),y1(1,:),'DisplayName','op. line','LineWidth',2,'Color',[0 0 0] );
plot(dp(1,1),dp(1,2),'DisplayName','Design Point', 'LineStyle','none','MarkerSize',8,'Marker','*', 'Color','b','LineWidth',1);
plot(ssline(:,1),ssline(:,2),'DisplayName','S.S. op. line','LineWidth',2,'LineStyle',':', 'Color',[0 0 1]);
xlabel('Fan Corrected Airflow (kg/s)');
ylabel('Fan Pressure Ratio');
xlim([350 680]);
ylim([1.48 1.9]);

subplot( 2,2,2 )
n_tab = MCP.Booster.N_tab;
eff_tab = MCP.Booster.Eta_tab;
wc_tab = MCP.Booster.Wcor_tab;
pr_tab = MCP.Booster.Pi_tab;
ssline = DATABASE_A(2:3,23:24);

hold on;
box on;
grid on;
[C,h] = contour( wc_tab, pr_tab, eff_tab );
clabel(C,h,'LabelSpacing',100);

plot( wc_tab', pr_tab', 'Color', [0.8 0.8 0.8],'DisplayName','speed lines (N_c)' );
plot( MCP.Booster.WcSurgeVec, MCP.Booster.PRSurgeVec,'DisplayName','stall line','MarkerSize',3,'Marker','o', 'LineWidth',2, 'Color', [0.8,0.8,0.8]  );
plot( x1(2,:),y1(2,:),'DisplayName','op. line','LineWidth',2,'Color',[0 0 0] );
plot(dp(2,1),dp(2,2),'DisplayName','Design Point', 'LineStyle','none','MarkerSize',8,'Marker','*', 'Color','b','LineWidth',1);
plot(ssline(:,1),ssline(:,2),'DisplayName','S.S. op. line','LineWidth',2,'LineStyle',':', 'Color',[0 0 1]);
xlabel('Booster Corrected Airflow (kg/s)');
ylabel('Booster Pressure Ratio');
xlim([51 87]);
ylim([1.44 1.69]);

subplot( 2,2,3 )
n_tab = MCP.Comp.N_tab;
eff_tab = MCP.Comp.Eta_tab;
wc_tab = MCP.Comp.Wcor_tab;
pr_tab = MCP.Comp.Pi_tab;
ssline = DATABASE_A(2:3,26:27);

hold on;
box on;
grid on;
[C,h] = contour( wc_tab, pr_tab, eff_tab,'DisplayName','\eta contours' );
clabel(C,h,'LabelSpacing',100);

plot( MCP.Comp.WcSurgeVec, MCP.Comp.PRSurgeVec,'DisplayName','Stall line','MarkerSize',3,'Marker','o', 'LineWidth',2, 'Color', [0.8,0.8,0.8]  );
plot( x1(3,:),y1(3,:),'DisplayName','Op. line','LineWidth',2,'Color',[0 0 0] );
plot(dp(3,1),dp(3,2),'DisplayName','Design Point', 'LineStyle','none','MarkerSize',8,'Marker','*', 'Color','b','LineWidth',1);
plot(ssline(:,1),ssline(:,2),'DisplayName','S.S. op. line','LineWidth',2,'LineStyle',':', 'Color',[0 0 1]);
plot( wc_tab', pr_tab', 'Color', [0.8 0.8 0.8],'DisplayName','Speed lines (N_c)' );
xlabel('Comp. Corrected Airflow (kg/s)');
ylabel('Comp. Pressure Ratio');
xlim([55 62]);
ylim([10.4 14.8]);
legend1 = legend('\eta contours','Stall line','Op. line','Design Point','S.S. op. line','Speed lines (N_c)');
newPosition = [0.59 0.13 0.3 0.3];
newUnits = 'normalized';
set(legend1,'Position', newPosition,'Units', newUnits);

print s6.eps -depsc2 -r600