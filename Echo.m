clc
clear all
%%
[data,Fs]=audioread('hello_new.wav');
%sound(y,Fs);
%%

length = size(data)
mono=(data(:,1)+data(:,2))/2;
length1 = size(mono)
vector=[zeros(1,11007782)];
vector(0.1*(10^5))=0.8;
vector(0.25*(10^5))=0.6;
vector(0.3*(10^5))=0.4;
%plot(vector);
 
%%
echo=conv(mono,vector);
figure;
plot(echo);
%sound(echo,Fs);
audiowrite('Echo.wav', echo,Fs)

