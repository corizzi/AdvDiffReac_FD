function [u] = gridReshape( GRID, u )
   u = reshape(u, GRID.Ny+2, GRID.Nx+2) ;
end
