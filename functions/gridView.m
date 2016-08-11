% -----------------------------------------------------------------------------
%    Copyright Alexandre Corizzi (alexandre.corizzi@gmail.com)
%
%    Ce logiciel est régi par la licence CeCILL-B soumise au droit
%    français et respectant les principes de diffusion des logiciels
%    libres. Vous pouvez utiliser, modifier et/ou redistribuer ce programme
%    sous les conditions de la licence CeCILL-B telle que diffusée par
%    le CEA, le CNRS et l'INRIA sur le site "http://www.cecill.info".
% -----------------------------------------------------------------------------

function [] = gridView( GRID, u, inter )
   
   if size(u, 2) == 1
       u = gridReshape( GRID, u) ;
   end

      a = GRID.X ;
   b = GRID.Y ;

   surf( GRID.X, GRID.Y, u ); 
   if inter   
	shading interp
   end       						 
   view(0, 90);
   colorbar;
end
