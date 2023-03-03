%MvsV_code - Análisis del voltaje aplicado y el factor de multiplicación de un detector de radiación tipo contador proporcional
% Universidad EAFIT, Departamento de Ciencias Físicas
% PROYECTO INSTRUMENTAL 3 - INFORME DE PROYECTO DE MATERIA 2
%
% Inputs:
%    a - Radio del ánodo (m)
%    b - Radio del cátodo o carcasa (m)
%    P - Presión atmosférica (atm)
%    K - Parámetro de Diethorn 1/Constante dependiente del gas (V/m*atm)
%    deltaV - Parámetro de Diethorn (V)
%
% Outputs:
%    M - Factor de multiplicación
%    p - Valor de M para 2000V
%
% Otros archivos .m requeridos: ninguno
% Subfunciones: ninguna
% Archivos MAT requeridos: none
%
% Autor: Maria Paula Rey Barrera/Melissa Tamayo Sepúlveda 
% email: mpreyb@eafit.edu.co/mtamayos@eafit.edu.co
% Octubre 2020; Última revisión: 23-Oct-2020

%------------- INICIO CÓDIGO --------------


clc 
clear all
close all
a = 0.00001;
b = 0.02;
P = 1;
K = 4800000;
deltaV = 23.6; 
y(2100)= 0.0;
x(2100)= 0.0;
r1=0.1;
r2=0.1;
r3=0.1;
r4=0.1;
r5=0.1;

for i = 1:1:2100
    x(i)=i;
    r1=i*log(2);
    r2=log(b/a)*deltaV;
    r3=P*a*log(b/a);
    r4=log(i/r3);
    r5=r4-log(K);
    y(i)= exp((r1/r2)*(r5));
    if i==2000
        p = y(i);
    end
end


figure('Name','Análisis de factor de multiplicacion');
plot (2000,p,'.'); hold on
plot(x, y), xlabel('Voltaje (V)'), ylabel('Factor de multiplicacion'), title('Factor de multiplicacion en funcion del voltaje');

%------------- FIN DEL CÓDIGO --------------


