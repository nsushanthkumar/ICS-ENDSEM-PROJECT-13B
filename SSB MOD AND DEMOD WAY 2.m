%SSB Modulation demodulation (fm=10Hz;fc=250Hz)
%modulating signal
fm=10;
fc=250;
%sampling frequency
fs=2*(fc+2*fm)*10;
t=0:1/fs:((2/fm)-(1/fs));
vm=1;%signal amplitude
w=2*pi*fm*t;%frequency
x=vm*sin(w);% message signal
%carrier signal
A=1;
c=A*sin(2*pi*fc*t);%carrier signal
vam=ssbmod(x,fc,fs);%SSB modulation expression
y=ssbdemod(vam,fc,fs);%SSB demodulation expression
subplot(4,1,1);
plot(t,x);
xlabel('time');
ylabel('x');
title('message signal');

subplot(4,1,2);
plot(t,c);
xlabel('time');
ylabel('c');
title('carrier signal');

subplot(4,1,3);
plot(t,vam);
xlabel('time');
ylabel('vam');
title('SSB modulated signal');

subplot(4,1,4);
plot(t,y);
xlabel('time');
ylabel('y');
title('SSB demodulated signal');