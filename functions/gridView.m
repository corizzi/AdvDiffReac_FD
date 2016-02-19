function [] = gridView( GRID, u, inter)
   
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
