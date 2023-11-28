%% Great hall impulse response spectrum
% http://isophonics.net/content/room-impulse-response-data-set
% Tb = length of the signal, s
% Fs = sampling frequency, Hz
% Tw = window width, s

% USE PLOT BROWSER TO VIEW SEPARATE PLOTS
% View -> Plot Browser

%% Setup
clear variables
close all
format shorteng
Tb = 2; %s
N = 192000;

%% Time, frequency vectors
[t, fn_os] = gen_time_freq_vectors(Tb, N);
%% Signal generation
[sig, Fs] = audioread('great_hall_imp.wav');
sig = sig';
%% Plots
plot_fun(t, sig, fn_os, Tb);



