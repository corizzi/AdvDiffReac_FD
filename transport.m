% -----------------------------------------------------------------------------
%    Copyright Alexandre Corizzi (alexandre.corizzi@gmail.com)
%
%    Ce logiciel est régi par la licence CeCILL-B soumise au droit
%    français et respectant les principes de diffusion des logiciels
%    libres. Vous pouvez utiliser, modifier et/ou redistribuer ce programme
%    sous les conditions de la licence CeCILL-B telle que diffusée par
%    le CEA, le CNRS et l'INRIA sur le site "http://www.cecill.info".
% -----------------------------------------------------------------------------

function [A, b] = transport ( GRID, D, v, dt, u0 )

Lx1 = GRID.Lx1  ;
Lx2 = GRID.Lx2  ;
Ly1 = GRID.Ly1  ;
Ly2 = GRID.Ly2  ;
Nx  = GRID.Nx   ;
Ny  = GRID.Ny   ;
N   = GRID.N    ;
Lx  = GRID.Lx   ;
Ly  = GRID.Ly   ;
dx  = GRID.dx   ;
dy  = GRID.dy   ;

X = GRID.X ;
Y = GRID.Y ;

% Conditions aux bords
global bt tp rg lf 

A = sparse( (Nx+2)*(Ny+2), (Nx+2)*(Ny+2) ) ;
b  = zeros( (Nx+2)*(Ny+2), 1 );

parfor i = 1:(Nx+2)*(Ny+2)
   t = sparse( (Nx+2)*(Ny+2), 1 ) ;
   [n,m] = ind2sub([Ny+2, Nx+2], i ) ;

x = X(m) ;
y = Y(n) ;

if ( m ~= 1 && m ~= Nx+2  && ... 
	     n ~= 1 && n ~= Ny+2  )

	     % C
	     t(i) = 1 + dt * (D/dx^2 + D/dy^2)
	     % E
	     t( sub2ind( [Ny+2, Nx+2], n, m+1) ) = ...
	     - dt * ( - v(1) / (4*dx) + D/(2*dx^2) )
	     % W
	     t( sub2ind( [Ny+2, Nx+2], n, m-1) ) = ...
	     - dt * ( v(1) / (4*dx) + D/(2*dx^2) )
	     % N
	     t( sub2ind( [Ny+2, Nx+2], n+1, m) ) = ...
	     - dt * ( - v(2) / (4*dy) + D/(2*dy^2) )
	     % S
	     t( sub2ind( [Ny+2, Nx+2], n-1, m) ) = ...
	     - dt * ( v(2) / (4*dy) + D/(2*dy^2) )

	     b(i) = u0(n,m)*(1-dt*(D/dx^2+D/dy^2)) + dt*( ...
	            u0(n,m+1)*( - v(1) / (4*dx) + D/(2*dx^2) ) + ...
		    u0(n,m-1)*( v(1) / (4*dx) + D/(2*dx^2) ) + ...
		    u0(n+1,m)*( - v(2) / (4*dy) + D/(2*dy^2) ) + ...
		    u0(n-1,m)*( v(2) / (4*dy) + D/(2*dy^2) ) );

    else % BC : All Dirichlet
	if ( m == Nx+2 ) % right	
	        t(i) = 1 ;
		b(i) = rg(x,y);
	elseif ( m == 1 ) % left 
	        t(i) = 1 ;
		b(i) = lf(x,y);
	elseif ( n == Ny+2 ) % top 
	        t(i) = 1 ;
		b(i) = tp(x,y);
	elseif ( n == 1 ) % bottom 
	        t(i) = 1 ;
		b(i) = bt(x,y);
	end
    end
   A(i, :) = t;
end
% b = setDirac( GRID, b, diracs ) ;
end
