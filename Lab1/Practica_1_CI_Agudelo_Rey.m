% Practica_1_CI_Agudelo_Rey
% Universidad EAFIT, Escuela de ciencias aplicadas e ingeniería 
% PROYECTO INSTRUMENTAL 3 - PRÁCTICA 2 CI: DESARROLLO DE CONTROL PID PARA
% UNA PLANTA DE NIVEL
% Subfunciones: ninguna
% Archivos MAT requeridos: none
%
% Autor: Juan Diego Agudelo Balvin; Maria Paula Rey Barrera
% email: jagudelob@eafit.edu.co; mpreyb@eafit.edu.co
% Oct 2022; Última revisión: 21-Oct-2022

%------------- INICIO CÓDIGO -------------


%%Creación del vector de tiempo%%
time=583;
Vector_time = [];           % Vector vacío para llenar con el tiempo de muestreo
Sample_time = time/30047;   % El sample time es igual al tiempo total de medición dividido entre en numero de datos del nivel
n = 30047;                  % Largo del vector columna, que debe ser igual al tamaño de el vector de los niveles

%%Loop para llenado del vector de tiempo%%

%for i = 1:n
 %   Vector_time(i) = Sample_time
 %   Sample_time = Sample_time + (time/30047)
%end

%Vector_columna = Vector_time.'

Peak = 79.524;
Constante = Peak * 0.63;
time_s = 92.9595;
a = 1/time_s;
K = Peak * a;

syms t s
s= tf('s');

G = K/(s + a);
P = exp(-6.3129*s)*K/(s + a);
SIT = 0.0875/(s+0.0011005);

%step(SIT)
plot(fittedmodel,'-m')
title('Comparación de las respuestas de las funciones de transferencia')
xlabel('Tiempo (s)')
ylabel('Nivel de la planta (%)')
hold on

%plot(Vector_columna,simout)
%title('Respuesta temporal de la planta obtenida con simulink')

hold on
step(P)
%title('Respuesta ante un step de la función de transferencia con aproximación de Padé')

hold on
step(G,'-g')
%title('Respuesta ante un step de la función de transferencia teórico-experimental')
hold off

Y = 5*(ones(30047,1));  % Vector lleno de 5
Y(1:15024)=0;           % Cambiar los valores de la mitad del vector por 0 para crear el step


%------------- FIN DEL CÓDIGO --------------
