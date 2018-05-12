function CreatePlot_NMSingle( n, m, data, name )

for i = 1 : n-1
    for j = 1 : m
        hsp = subplot( n, m, m*(i-1)+j );
        plot( data( 1, : ), data( m*(i-1)+j+1, : ),'LineWidth',2 );
        xlabel( name{1} );
        ylabel( name{m*(i-1)+j+1} );
        grid on;
    end
end

for j = 1 : m
        subplot( n, m, m*(n-1)+j );
        plot( data( 1, : ), data( m*(n-1)+j+1, : ),'LineWidth',2 );
        xlabel( name{1} );
        ylabel( name{m*(n-1)+j+1} );
        grid on;
end

end