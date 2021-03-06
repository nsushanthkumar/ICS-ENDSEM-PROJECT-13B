fc = 100; %frequency for carrier signal.
fm = 20; %frequency for message signal.
fs= 2000; %we are assigning sampling frequency.
t = (0 : 1 / fs :1 ); %and the time duration
t = linspace(0, 1, 1000); 
m = cos(2 * pi * fm * t); %developing the cosine wave with the time duration 't'
mh = imag(hilbert(m)); %hilbert transform for message signal
ssub = m .* cos(2 * pi * fc * t) - mh .* sin(2 * pi * fc * t); 
%Demodulation 
em = ssub.*m; 
[ n,cfs ] = buttord(2/1000,4/1000, .5, 5);
[ b,a ] = butter(n,cfs,'low'); 
demodulation = filter(b,a,em); 
figure; 
plot(t, ssub); 
title('Single SideBand Modulation'); 
xlabel('Time(sec)'); 
ylabel('Amplitude'); 
figure; 
plot(t, em); 
title('Single SideBand Demodulation'); 
xlabel('Time(sec)'); 
ylabel('Amplitude'); 
figure; 
plot(t, demodulation); 
title('Filtered Signal');
xlabel('Time(sec)'); 
ylabel('Amplitude');
%w = linspace(0,pi);
%freqz(r,s,w)
