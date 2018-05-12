function CreatePlot_MultiInOne( data, range, name, lname ) 

for i = 1 : size( data, 1 )-1
        plot( data( 1, : ), data( i+1,: ),'LineWidth',2 );
        xlabel( name{1} );
        ylabel( name{2} );
        hold on;
end

ylim( range );
legend( lname,'Location','SouthEast' );
grid on;
end