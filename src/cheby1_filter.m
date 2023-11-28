%% Chebyshev type 1 filter 
% Tb = length of the signal, s
% Fs = sampling frequency, Hz
% Fp = bandpass frequencies (normalized)
% Fs = bandstop frequencies (normalized)
% Rp = passband ripple, dB
% Rs = stopband attenuation, dB
% n = filter order

% USE PLOT BROWSER TO VIEW SEPARATE PLOTS
% View -> Plot Browser

%% Setup
clear variables
close all
format shorteng
Tb = 0.1; %s
N = 2048;
tau = Tb/N;
Fs = 1/tau;

%% Time, frequency vectors
[t, fn_os] = gen_time_freq_vectors(Tb, N);
%% Signal generation

Fp = [0.6 0.8];
Fs = [0.55 0.85];
Rp = 3;
Rs = 60;
[n, Fn] = cheb1ord(Fp, Fs, Rp, Rs);
[b, a] = cheby1(n, Rp, Fn);

sig = impz(b, a, N)';

%% Plots
plot_fun(t, sig, fn_os, Tb);



