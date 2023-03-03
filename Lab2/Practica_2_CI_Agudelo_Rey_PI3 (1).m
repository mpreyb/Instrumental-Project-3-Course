% Practica_2_CI_Agudelo_Rey
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


s = tf('s');

Peak = 79.524;
Constante = Peak * 0.63;
time_s = 92.9595;
a = 1/time_s;
K = Peak * a;
Ts=0.005;   


Ge = K/(s + a);                    %Función de respuesta temporal
Gp_exp = exp(-6.3129*s)*Ge;        %Función con Padé 
%Gp = pade(Gp_exp,1);               %Función Padé orden 1
Gs = 0.0875/(s+0.0011005);         %Función obtenida con SIT

Gc = 0.12221 + (0.0013298/s) + 0.49767*s;   %Funcion PID

% figure(30)
% bode(Ge)
% title('Diagrama de Bode para Ge')
% figure(31)
% bode(Gp)
% title('Diagrama de Bode para Gp')
% figure(32)
% bode(Gs)
% title('Diagrama de Bode para Gs')

%% Respuestas de las TF ante un impulso

%Comparación de todas las funciones ante un impulso
%figure(1)
%impulse(Ge,Gp,Gs)
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante un impulso de Ge, Gp y Gs')
%legend({'Ge','Gp', 'Gs'})


%Respuesta de Ge ante un impulso
%figure(2)
%impulse(Ge)
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante un impulso de Ge')
%legend({'Ge'})


%Respuestas de Gp ante un impulso
%figure(3)
%impulse(Gp)
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante un impulso de Gp')
%legend({'Gp'})


%Respuestas de Gs ante un impulso
%figure(3)
%impulse(Gs)
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante un impulso de Gs')
%legend({'Gs'})


%% Respuestas de las TF ante un escalón

%Respuestas de las TF ante un escalon
%figure(4)
%step(Ge,Gp,Gs)
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante un escalon de las TF')
% legend({'Ge','Gp','Gs'})


%Respuestas de Ge ante un escalon
%figure(5)
%step(Ge)
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante un escalon de Ge')
%legend({'Ge'})


%Respuestas de Gp ante un escalon
%figure(6)
%step(Gp)
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante un escalon de Gp')
%legend({'Gp'})


%Respuestas de Gs ante un escalon
%figure(6)
%step(Gs)
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante un escalon de Gs')
%legend({'Gs'})


%% Respuestas de las TF ante una rampa


t_ramp=0:0.005:300;         %Vector de tiempo para la rampa
ramp = t_ramp;              %Rampa


%Respuestas de las TF ante una rampa
%figure(7)
%lsim(Ge,Gp,Gs,ramp,t_ramp)
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante una rampa de las TF')
%legend({'Ge','Gp','Gs'})


%Respuestas de Ge ante una rampa
%figure(8)
%lsim(Ge,ramp,t_ramp)
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante una rampa de Ge')
%legend({'Ge'})


%Respuestas de Gp ante una rampa
%figure(9)
%lsim(Gp,ramp, t_ramp)
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante una rampa de Gp')
%legend({'Gp'})


%Respuestas de Gs ante una rampa
%figure(9)
%lsim(Gs,ramp, t_ramp)
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante una rampa de Gs')
%legend({'Gs'})


%% Respuesta de las TF ante una sinusoide


t_sinus=0:0.005:250;
w=0.05;                           %Frecuencia de la sinusoide (rad/s)
sinusoide = sin(w*t_sinus);       %Sinusoide


%Respuestas de las TF experimental ante una sinusoide
%figure(10)
%lsim(Ge,Gp,Gs,sinusoide,t_sinus);
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante una sinusoide de las TF')
%legend({'Ge','Gp','Gs'})


%Respuestas de Ge ante una sinusoide
%figure(11)
%lsim(Ge,sinusoide,t_sinus);  
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante una sinusoide de Ge')
%legend({'Ge'})


%Respuestas de Gp ante una sinusoide
%figure(12)
%lsim(Gp,sinusoide,t_sinus); 
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante una sinusoide de Gp')
%legend({'Gp'})


%Respuestas de Gs ante una sinusoide
% figure(12)
% lsim(Gs,sinusoide,t_sinus); 
% xlabel('Tiempo [s]')
% ylabel('Nivel [%]')
% title('Respuesta ante una sinusoide de Gs')
% legend({'Gs'})


%% Lugar de las raices

%Para Gp
%figure(13)
%rlocus(Gp)
%title('Lugar de las raíces de Gp')


%% Diagrama de Bode

% figure(16)
% bode(Gp)
% title('Diagrama de Bode de Gp')
% legend({'Gp'})

%% Diagrama de Nyquist

% figure(17)
% nyquist(Gp)
% title('Diagrama de Nyquist de Gp')
% legend({'Gp'})

%% Diseno de control PID

%pidTuner(Gp_exp,'PID')

%% PID Controller: Bode

%figure(1)
bode(Gc)
%title('Diagrama de Bode de Gc')
%legend({'Gc'})

%% PID Controller: Nyquist
% nyquist(Gp)
% title('Diagrama de Nyquist de Gc')
% legend({'Gc'})

%% PID Controller: step response
%step(Gc)
%xlabel('Tiempo [s]')
%ylabel('Nivel [%]')
%title('Respuesta ante un escalon de Gc')
%legend({'Gc'})