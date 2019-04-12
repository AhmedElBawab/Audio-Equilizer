n = 7;

a = fir1(n,0.3,'high');
b = fir1(n,0.7,'low');

[y,fs] = audioread('NoisySpeech-16-22p5-mono-5secs.wav');

o = filter(a,1,y);
p = filter(b,1,o);

fvtool(p,1);

figure;
plot(y);

figure;
plot(p);

%Do Fourier Transform
y_fft = abs(fft(y));            %Retain Magnitude
y_fft = y_fft(1:Nsamps/2);      %Discard Half of Points
f = Fs*(0:Nsamps/2-1)/Nsamps;   %Prepare freq data for plot

figure;
plot(y_fft);

%Do Fourier Transform
y_fft2 = abs(fft(p));            %Retain Magnitude
y_fft2 = y_fft2(1:Nsamps/2);      %Discard Half of Points

figure;
plot(y_fft2);

