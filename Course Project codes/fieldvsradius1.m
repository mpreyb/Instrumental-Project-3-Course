
clc 
clear all
close all
a = 0.00001;
b = 0.02;
Vo = 2000;
y(1000000)= 0.0;
x(1000000)= 0.0;
r1=0.1;
r2=0.1;
%p=0.0;


for i = 1:1:1e-4
    x(i)= i;
    r1=i*log(b/a);
    y(i)=Vo/r1;
    if i==2000
        p = y(i);
    end
end

% for i = 1:1:3000  %i=distancia
%     y(i)= i;
%     %r1 = Vo*1.0;
%     r2 = i*log(b/a);
%     x(i)= Vo/r2;
% %     if i==0.5
% %         p = y(i);
% %     end
% end


figure('Name','idk');
% plot (10e+06,p,'.'); hold on
plot(x, y), xlabel('Distancia (V)'), ylabel('Campo (V/m)'), title('Campo en función de la distancia');
