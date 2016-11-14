% clear all;
% clc;
% w_low=2*pi*20;
% w_high=2*pi*100;
% A_Low=100;
% A_high=100;
% fai=0;
% t=1:0.1:100;
% data_low=A_Low*sin(w_low*t+fai);
% data_high=A_high*sin(w_high*t+fai);
% plot(data_low);
% figure;
% plot(data_high);

Fs = 1000;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = 1000;             % Length of signal
t = (0:L-1)*T;        % Time vector
S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
X = S + 2*randn(size(t));
plot(1000*t(1:50),X(1:50))
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (milliseconds)')
ylabel('X(t)')
Y = fft(X);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
figure('Name','∏µ¿Ô“∂∆µ∆◊');
plot(f,P1)
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%My experiment
Fs = 1000;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = 1000;             % Length of signal
t = (0:L-1)*T;        % Time vector
data_low=sin(2*pi*20*t);
data_high=sin(2*pi*60*t);
% data_low=[10*data_low(1,1:L/2),data_high(1,(L/2+1):L)];
data_low=10*data_low+data_high;
plot(data_low);
title('ø’”ÚÃÿ’˜');
xlabel('Data Orders')
ylabel('Range')
Y_low= fft(data_low);
P2 = abs(Y_low/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
figure;
plot(f,P1);
title('∆µ”ÚÃÿ’˜');
xlabel('f (Hz)')
ylabel('|P1(f)|')