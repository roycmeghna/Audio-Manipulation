clc
clear all
%%
[data, Fs] = audioread('hello_new.wav');
data_period = 1/Fs;
t = (0:data_period:(length(data)-1)/Fs);
subplot(2,2,1);
plot(t,data);
title('Time Domain Representation - Unfiltered Sound');
xlabel('Time (seconds)');
ylabel('Amplitude');
xlim([0 t(end)]);
m = length(data); 
n = pow2(nextpow2(m));
y = fft(data, n);
f = (0:n-1)*(Fs/n);
amplitude = abs(y)/n;
subplot(2,2,2);
plot(f(1:floor(n/2)),amplitude(1:floor(n/2)));
title('Frequency Domain Representation - Unfiltered Sound');
xlabel('Frequency');
ylabel('Amplitude');
 
%%
order = 7;
[b,a] = butter(order,1000/(Fs/2),'low');
filtered_sound = filter(b,a,data);
%sound(filtered_sound, Fs)
audiowrite('Filtered.wav', filtered_sound, Fs)


