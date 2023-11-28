%% Sine and dc signal spectrum
% Tb = length of the signal, s
% Fs = sampling frequency, Hz
% f = sine frequency, Hz
% Tw = window width, s

% USE PLOT BROWSER TO VIEW SEPARATE PLOTS
% View -> Plot Browser

%% Setup
clear variables
close all
format shorteng
Tb = 0.1; %s
N = 128;

f = 100;


%% Time, frequency vectors
[t, fn_os] = gen_time_freq_vectors(Tb, N);
%% Signal generation

sig_gen = @(t) 1 + sin(2*pi*f*t);
sig = sig_gen(t);


%% Plots
plot_fun(t, sig, fn_os, Tb);



