clc
clear all
%%

function[]=myDCT()  %compression function
%% 
%read a file and convert it to a vector
[funky, f] = audioread('hello_new.wav');
 
%chosing a block size 
windowSize = 8192;
 
%changing compression  percentages
samplesHalf = windowSize / 2;
samplesQuarter = windowSize / 4;
samplesEighth = windowSize / 8;
 
%initializing compressed matrice
Compressed2 = [];
Compressed4 = [];
Compressed8 = [];
 
%%
%actual compression
for i=1:windowSize:length(data)-windowSize
    windowDCT = dct(data(i:i+windowSize-1));
    Compressed2(i:i+windowSize-1) = idct(windowDCT(1:samplesHalf), windowSize);
    Compressed4(i:i+windowSize-1) = idct(windowDCT(1:samplesQuarter), windowSize);
    Compressed8(i:i+windowSize-1) = idct(windowDCT(1:samplesEighth), windowSize);
end

%%
 %plotting audio signals
figure(1)
h1 = subplot(4,1,1);
plot(data), title('Original Waveform');
subplot(4,1,2)
plot(Compressed2), title('Compression Factor 2'), axis(axis(h1));
subplot(4,1,3)
plot(Compressed4), title('Compression Factor 4'), axis(axis(h1));
subplot(4,1,4)
plot(Compressed8), title('Compression Factor 8'), axis(axis(h1)); 

%%
%expanded view of audio signals
figure(2)
h1 = subplot(4,1,1); plot(data(100000:120000)), title('Portion of Original Waveform');
subplot(4,1,2)
plot(Compressed2(100000:120000)), title('Portion of Compression Factor 2'), ;
subplot(4,1,3)
plot(Compressed4(100000:120000)), title('Portion of Compression Factor 4'), axis(axis(h1));
subplot(4,1,4)
plot(Compressed8(100000:120000)), title('Portion of Compression Factor 8'), axis(axis(h1)); 

%%
%saving to wave files
audiowrite('CompressionFactor2.wav',Compressed2,f)
audiowrite('CompressionFactor4.wav',Compressed4,f)
audiowrite('CompressionFactor8.wav',Compressed8,f)

%%
%playing files
disp('Original');
audioplay(data, f);
disp('Compression Factor 2');
audioplay(Compressed2, f);
disp('Compression Factor 4');
audioplay(Compressed4, f);
disp('Compression Factor 8');
audioplay(Compressed8, f);
sound(data,f);
end


 
