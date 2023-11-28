%% BFSK signal spectrum
% Tb = length of the signal, s
% Fs = sampling frequency, Hz
% Fc = central frequency, Hz
% Fdev = frequency deviation, Hz
% Fmod = frequency of modulating signal (normalized)
% Tw = window width, s

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
n = 0:N-1;

Fc = (Fs/2)*0.3
Fdev = Fc*0.3
Fmod = 4/Tb/Fs;

sig_mod = sign(sin(2*pi*n*Fmod));
sig = fmmod(sig_mod, Fc, Fs, Fdev);

%% Plots
plot_fun(t, sig, fn_os, Tb);



