%DEFINING OF AM MODULATION INDEX

disp('Example: m=1 means 100% modulation');
m=input('Enter the value of modulation index (m) = ');
%m = 1; %for 100% modulation
if (0>m||m>1)
    error('m may be less than or equal to one and greater than zero'); 
end

%MODULATING SIGNAL GENERATION

Am = input('Enter the value of amplitude modulation = ');
n = input('Enter the number of cycles = ');     %input for number of modulationd signal cycles
%Am = 5; %Amplitude of modulating signal
fa = 2000;              %Frequency of modulating signal
Ta = 1/fa;              %Time period of modulating signal
t = 0:Ta/999:n*Ta;      %Total time for simulation
ym = Am*sin(2*pi*fa*t); %Equation of modulating signal
figure(1) 
subplot(3,1,1); 
plot(t,ym), grid on;    %Graphical representation of Modulating signal
%axis ([0 1 -5 5]);
title('Modulating Signal');
xlabel('time(sec)');
ylabel('Amplitude(volt)');

%CARRIER SIGNAL GENERATION
Ac = Am/m;              %Amplitude of carrier signal [where, modulation Index(m) = Am/Ac]
fc = fa*10;             %Frequency of carrier signal
Tc = 1/fc;              %Time period of carrier signal
yc = Ac*sin(2*pi*fc*t); %Eqation of carrier signal
subplot(3,1,2);
plot(t,yc), grid on;    %Graphical representation of carrier signal
title('Carrier Signal');
xlabel('time(sec)');
ylabel('Amplitude(volt)');

%AM MODULATION
y = Ac*(1+m*sin(2*pi*fa*t)).*sin(2*pi*fc*t); %Equation of Amplitude
%modulated signal
subplot(3,1,3);
plot(t,y);  %Graphical representation of AM signal
title('Amplitude Modulated Signal');
xlabel('time(sec)');
ylabel('Amplitude(volt)');
grid on;
