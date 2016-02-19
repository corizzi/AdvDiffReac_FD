function [ u ]  = gridInter ( GRID,  fun ) 

    u = zeros((GRID.Nx+2)*(GRID.Ny+2), 1) ;

    a = GRID.X ;
    b = GRID.Y ;

    parfor i = 1:(GRID.Nx+2)*(GRID.Ny+2)

        [n,m] = ind2sub([GRID.Ny+2, GRID.Nx+2], i ) ;

	u(i) = fun( a(m), b(n) ) 
    end
    u = gridReshape( GRID, u ) ;
end


