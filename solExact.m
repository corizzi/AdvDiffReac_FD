% -------------------------------------------
% Finite Difference Method for ADR problems
% -------------------------------------------

clc, clear, tic
addpath('functions/')
global tp bt rg lf


% Diff coef
D  = .1 ;
% Velocity of solvent
v = [-1, 1] ;
% Time Discretization
T = 1 ;
nbFra = 5 ;

C0 = 0 ;
CL = 1 ;
L = 1 ;

f = @(x) (exp(v(1)*L/D)-1)^-1 * ...
(exp(v(1)*x/D)*(CL-C0-L/v(1)) + L/v(1) - CL + exp(v(1)*L/D)*C0) ...
+ x/v(1) ;
alpha = v(1) / D ;

fplot(f,[0,L]);
title(['\alpha = '  num2str(alpha)])

break ;

