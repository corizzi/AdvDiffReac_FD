% -----------------------------------------------------------------------------
%    Copyright Alexandre Corizzi (alexandre.corizzi@gmail.com)
%
%    Ce logiciel est régi par la licence CeCILL-B soumise au droit
%    français et respectant les principes de diffusion des logiciels
%    libres. Vous pouvez utiliser, modifier et/ou redistribuer ce programme
%    sous les conditions de la licence CeCILL-B telle que diffusée par
%    le CEA, le CNRS et l'INRIA sur le site "http://www.cecill.info".
% -----------------------------------------------------------------------------

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


