n = 0:159;
x = cos(pi/8*n)+cos(pi/2*n)+sin(3*pi/4*n);
d = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2', ...
    1/4,3/8,5/8,6/8,60,1,60);
Hd = design(d,'equiripple');

freqz(Hd)

%y = filter(Hd,x);
y = filter(test2,x);
freq = 0:(2*pi)/length(x):pi;
xdft = fft(x);
ydft = fft(y);

plot(freq/pi,abs(xdft(1:length(x)/2+1)))
hold on
plot(freq/pi,abs(ydft(1:length(x)/2+1)))
hold off
xlabel('Normalized Frequency (\times\pi rad/sample)')
legend('Original Signal','Bandpass Signal')