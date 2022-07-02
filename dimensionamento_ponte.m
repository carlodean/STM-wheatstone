% relazione ponte di wheatstone

close all
clear all
clc

% dati
T25 = 25 + 273.15;
T62 = 62.5 + 273.15; 
T100 = 100 + 273.15; 
T24 = 24.60 + 273.15;
T98 = 98.857 + 273.15; 
R24 = 10710; 
R98 = 654.3; 

%calcolo beta
beta = (log(R98/R24))/(1/T98-1/T24);

%impogo
Vx62 = 1.5; 
Vx100 = 3;

%sistema 
R25 = R24*exp(beta*(1/T25-1/T24));
R62 = R24*exp(beta*(1/T62-1/T24));
R100 = R24*exp(beta*(1/T100-1/T24));
Rr62 = R25/R62;
Rr100 = R25/R100;
tmp = (Vx100*(Rr62-1))/(Vx62*(Rr100-1));

% Dimensionamento 
ro = (tmp-1)/(Rr62-(Rr100*tmp)) % R4/R3
R2 = ro*R25    %R2
E = Vx100*(1+ro)*(1+(ro*Rr100))/(ro*(Rr100-1)) % Tensione di alimentazione del ponte

% controllo potenza dissipata

Pmax = (E^2)/(4*R2) 

