% Time ? ? ? ?
% ? ? ? ? N_1
% N_2 T_{45} Ps_3 EPR ?
%
% ? ? ? ? u_r
% W_f q S w1dot w2dot

Model_setup;
load ResultA.mat;
DataA = Result;
load ResultB.mat;
DataB = Result;
load ResultC.mat;
DataC = Result;
load ResultD.mat;
DataD = Result;
load TEST_C.mat;

Name = { "Time (sec)", "N_1 (rpm)", "T_{45} (K)" };
LName = { 'Ideal', 'Rate Limited' };
Range = [2800 3150;700 1150];
Data1 = [ DataA( 10, : ); DataB( 10, : ) ];
Data2 = [ DataA( 12, : ); DataB( 12, : ) ];
CreatePlot_DualMulti(  DataA( 1, : ), Data1, Data2, Range, Name, LName );
print s1.eps -depsc2 -r600

Name = { "Time (sec)", "Rate of W_f (kg/s^2)", "Sliding function S(t)" };
LName = { 'Ideal', 'Rate Limited' };
Range = [-1.6 3;-0.1 0.12];
Data1 = [ DataA( 25, : ); DataB( 25, : ) ];
Data2 = [ DataA( 28, : ); DataB( 28, : ) ];
CreatePlot_DualMulti(  DataA( 1, : ), Data1, Data2, Range, Name, LName );
print s2.eps -depsc2 -r600

Name = { "Time (sec)", "N_1 (rpm)", "T_{45} (K)" };
LName = { 'Ideal', 'Rate Limited' };
Range = [2800 3150;760 1000];
Data1 = [ DataC( 10, : ); DataD( 10, : ) ];
Data2 = [ DataC( 12, : ); DataD( 12, : ) ];
CreatePlot_DualMulti(  DataC( 1, : ), Data1, Data2, Range, Name, LName );
print s3.eps -depsc2 -r600

Name = { "Time (sec)", "Rate of W_f (kg/s^2)", "Sliding function S(t)" };
LName = { 'Ideal', 'Rate Limited' };
Range = [-1.2 1.2;-0.1 0.12];
Data1 = [ DataC( 25, : ); DataD( 25, : ) ];
Data2 = [ DataC( 28, : ); DataD( 28, : ) ];
CreatePlot_DualMulti(  DataC( 1, : ), Data1, Data2, Range, Name, LName );
print s4.eps -depsc2 -r600

Name = { "Time (sec)", "N_2 (rpm)", "EPR", "Ps_3 (kPa)", "W_f (kg/s)" };
Data = [ DataD( 1, : ); DataD( 11, : ); DataD( 14, : ); DataD( 13, : ); DataD( 26, : ) ];
CreatePlot_NMSingle( 2, 2, Data, Name );
print s5.eps -depsc2 -r600

Name = { "Time (sec)", "\Delta a_{11}", "\Delta a_{12}", "\Delta b_{1}", "\Delta a_{21}", "\Delta a_{22}", "\Delta b_{2}", "\Delta c_{11}", "\Delta c_{12}", "\Delta d_{1}", "\Delta c_{21}", "\Delta c_{22}", "\Delta d_{2}"};
Data = [ DataD( 1, : ); DATABASE_C( :, 10 )'; DATABASE_C( :, 11 )'; DATABASE_C( :, 14 )'; DATABASE_C( :, 12 )'; DATABASE_C( :, 13 )'; DATABASE_C( :, 15 )'; DATABASE_C( :, 16 )'; DATABASE_C( :, 17 )'; DATABASE_C( :, 20 )'; DATABASE_C( :, 18 )'; DATABASE_C( :, 19 )'; DATABASE_C( :, 21 )' ];
CreatePlot_NMSingle( 4, 3, Data, Name );
print s7.eps -depsc2 -r600

close( figure(1) );
Name = { "Time (sec)", "Assumption Requests"};
LName = { 'w_1/k_B', 'w_2/k_B', 'Norm(N)/\sigma', 'F_a', 'F_b' };
Range = [-1.5 1.5];
Data = [ DataD( 1, : ); DataD( 29, : )/0.064; DataD( 30, : )/0.064; DATABASE_C( :, 1 )'/-0.8; DATABASE_C( :, 8 )'; DATABASE_C( :, 9 )' ];
sigma = [-0.8 -0.41 -0.9];
for i = 1 : length( DataD( 1, : ) )
   
    Data( 4, i ) = DATABASE_C( i, DataD( 27, i ) ) / sigma( DataD( 27, i ) );
end

CreatePlot_MultiInOne( Data, Range, Name, LName );
plot([0 10],[1 -1;1 -1],'LineWidth',2,'Color',[0 0 0]);
print s8.eps -depsc2 -r600

