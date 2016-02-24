% -----------------------------------------------------------------------------
%    Copyright Alexandre Corizzi (alexandre.corizzi@gmail.com)
%
%    Ce logiciel est régi par la licence CeCILL-B soumise au droit
%    français et respectant les principes de diffusion des logiciels
%    libres. Vous pouvez utiliser, modifier et/ou redistribuer ce programme
%    sous les conditions de la licence CeCILL-B telle que diffusée par
%    le CEA, le CNRS et l'INRIA sur le site "http://www.cecill.info".
% -----------------------------------------------------------------------------

function [GRID] = gridGen( dim, nUnk ) ;
    % Dimensions
    GRID.Lx1 = min( dim(1), dim(3) ) ;
    GRID.Lx2 = max( dim(1), dim(3) ) ;
    GRID.Ly1 = min( dim(2), dim(4) ) ;
    GRID.Ly2 = max( dim(2), dim(4) ) ;
    % Number of unknows for two directions
    GRID.Nx = nUnk(1); GRID.Ny = nUnk(2); 
    % Total number of nodes
    GRID.N = (GRID.Nx + 2) * (GRID.Ny + 2) ;
    % Sizes 
    GRID.Lx =  GRID.Lx2 - GRID.Lx1 ; 
    GRID.Ly =  GRID.Ly2 - GRID.Ly1 ; 
    % Step of mesh in two directions
    GRID.dx = GRID.Lx / GRID.Nx ; 
    GRID.dy = GRID.Ly / GRID.Ny ;
    % Points for the x direction 
    GRID.X = [GRID.Lx1 ...
    GRID.Lx1+GRID.dx/2:GRID.dx:GRID.Lx2-GRID.dx/2 ...
    GRID.Lx2]; 
    % Points for the y direction 
    GRID.Y = [GRID.Ly1 ...
    GRID.Ly1+GRID.dy/2:GRID.dy:GRID.Ly2-GRID.dy/2 ...
    GRID.Ly2];
    % Display result
    disp([' --- Nouvelle Grille --- '])
    disp(['Nombre de cellules : ' num2str(GRID.N)])
    disp(['          inconues : ' num2str(GRID.Nx*GRID.Ny)])
    disp([' --- --------------- --- '])
end
