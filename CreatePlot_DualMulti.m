function hsp = CreatePlot_DualMulti( x_tab, data1, data2, range, name, lname )

hsp(1) = subplot( 2, 1, 1 );
plot( x_tab, data1,'LineWidth',2 );
xlabel( name{1} );
ylabel( name{2} );
legend( lname );
ylim( range(1,:) );
grid on;

hsp(1) = subplot( 2, 1, 2 );
plot( x_tab, data2,'LineWidth',2 );
xlabel( name{1} );
ylabel( name{3} );
legend( lname );
ylim( range(2,:) );
grid on;

end