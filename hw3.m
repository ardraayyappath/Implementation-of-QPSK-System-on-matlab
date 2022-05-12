
%name : Ardra Ayyappath
%NU ID : 002172340


clc;
clear all;




ts = 2 * 10^-3; % symbol duration in microseconds
fc = 1 * 10^3; % carrier frequency in Mhz
fs = 50 * 10^3; % sampling frequency in Mhz
Ns = 4;% since we need to calculate for 8 bits, we keep ns as 4
Ns = 50;
Rs = 1/ts; % symbol rate 
N = fs/Rs;

%transmission function is called
[data,N,s,ts]= tx_QPSK(fs,Rs,Ns,fc);
th = ts;
plot(ts,s, 'LineWidth',2);
xlim([0.001 0.008])
xlabel("transmitted signal");
ylabel("time vector of signal transmitted");
title("Graph for transmitted signal");

% Question 2 
h1 = 0.8*Delta(th,0);
h2 = h1+0.4*Delta(th,3e-10/1e-6)+0.2*Delta(th,4.2e-4);
h3 = 0.6*Delta(th,0) + 0.3*Delta(th,6.4e-4) + 0.4*Delta(th,7*10^-10/10^-6);

[r1,tr1]=channel_and_noise(h1,th,s,ts);
[r2,tr2]=channel_and_noise(h2,th,s,ts);
[r3,tr3]=channel_and_noise(h3,th,s,ts);

figure
plot(tr1, r1, 'LineWidth',2);
xlim([0.001 0.008])
xlabel("time vector 1");
ylabel("signal 1 after addition of AWGN noise");
title("Received signal with noise");

figure
plot(tr2,r2, 'LineWidth' ,2 );
xlim([0.001 0.008])
xlabel("time vector 2");
ylabel("signal 2 after addition of AWGN noise");
title("Received signal with noise");

figure
plot(tr3,r3 , 'LineWidth', 2);
xlim([0.001 0.008])
xlabel("time vector 3");
ylabel("signal 3 after addition of AWGN noise");
title("Received signal with noise");

% Question 3 A)

% Constellation for I/Q values

 
[I1,Q1,datar1]=rx_QPSK(fs,Rs,Ns,fc,r1);
[I2,Q2,datar2]=rx_QPSK(fs,Rs,Ns,fc,r2);
[I3,Q3,datar3]=rx_QPSK(fs,Rs,Ns,fc,r3);

figure 
plot(I1,Q1, '+','LineWidth',2);
hold on
yline(0);
xline(0);
hold off
xlabel("In Phase 1");
ylabel("Quadrature 1");
title("Constellation figure 1");

figure 
plot(I2,Q2, '+','LineWidth',2);
hold on
yline(0);
xline(0);
hold off
xlabel("In Phase 2");
ylabel("Quadrature 2");
title("Constellation figure 2");

figure
plot(I3,Q3, '+','LineWidth',2);
hold on
yline(0);
xline(0);
hold off
xlabel("In Phase 3");
ylabel("Quadrature 3");
title("Constellation figure 3");

% Question 3 B) Calculating the bit error rate
[~,BER1] = biterr(data, datar1);
[~,BER2] = biterr(data, datar2);
[~,BER3] = biterr(data, datar3);

BER1*100
BER2*100
BER3*100







