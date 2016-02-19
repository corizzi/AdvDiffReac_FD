% -------------------------------------------
% Finite Difference Method for ADR problems
% -------------------------------------------

clc, clear, tic
addpath('functions/')
global tp bt rg lf

% Diff coef
D  = .2 ;
% Velocity of solvent
v = [-2, -2] ;
% Time Discretization
T = 2 ;
nbFra = 50 ;

%% Initial Condition
GRID = gridGen2D( [0 10 ; 0 10], [70 70] )
u = gridInter ( GRID, @(x,y) 0  ) ;
a = GRID.X ; b = GRID.Y ;
for i=1:GRID.Ny
    for j=1:GRID.Nx
    if (a(j)-3)^2 + (b(i)-8)^2 < 2^2% || ...
%       (a(j)-8)^2 + (b(i)-8)^2 < 1^2
	u(i,j) = 1 ;
	end
    end
end

% Boundary Dirichlet conditions
tp = @(x,y) .0 ; 
bt = @(x,y) 0 ;
rg = @(x,y) .0 ;
lf = @(x,y) 0 ;

figure, gridView( GRID, u, true);
title(['t = Init'])
%colormap( [jet();flipud( jet() );0 0 0] );
%load spine
%colormap(map)

%break
pause

%% LOOP
dt = T/nbFra ;
for t = dt:dt:T
    disp(t)
    [A, b] = transport ( GRID, D, v, dt, u) ;
    u = gridReshape( GRID, A \ b ) ;
    gridView( GRID, u, true);
    title(['t = ' num2str(t) '/' num2str(T)])
    pause(0.01);     
end
