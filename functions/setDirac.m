% -----------------------------------------------------------------------------
%    Copyright Alexandre Corizzi (alexandre.corizzi@gmail.com)
%
%    Ce logiciel est régi par la licence CeCILL-B soumise au droit
%    français et respectant les principes de diffusion des logiciels
%    libres. Vous pouvez utiliser, modifier et/ou redistribuer ce programme
%    sous les conditions de la licence CeCILL-B telle que diffusée par
%    le CEA, le CNRS et l'INRIA sur le site "http://www.cecill.info".
% -----------------------------------------------------------------------------

function [b] = setDirac( GRID, b, diracs ) 

    dx = GRID.dx ;
    dy = GRID.dy ;

    if size(diracs, 2) ~= 3
	disp('Warning : no diracs')	
	return
    end

    for i = 1:size(diracs, 1)
	
	x = diracs(i, 1) ;
	y = diracs(i, 2) ;

	value = diracs(i, 3) ;

	if x < GRID.Lx1 || x > GRID.Lx2 || ...
	   y < GRID.Ly1 || y > GRID.Ly2 
	   disp('Error : Misplaced dirac : coords out of bounds')
	   continue 
	end

%	disp(['Placed d : (' num2str(x) ',' num2str(y) ',' num2str(z) ') : ' ...
%	 num2str(value)] ) 

	x = nearest((x - GRID.Lx1) / GRID.Lx * (GRID.Nx+2)) ;
	y = nearest((y - GRID.Ly1) / GRID.Ly * (GRID.Ny+2)) ;
	
	b( sub2ind( [GRID.Ny+2, GRID.Nx+2], y, x ) ) = value ;%*(dx*dy*dz);	

%	disp(['=[(' num2str(x) ',' num2str(y) ',' num2str(z) ')]']);

	     		
   end
end
