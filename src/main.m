f = 100;

N = 1024;
tau = T/N;
Fs = 1/tau;


%% Test signal

for i = 0:N-1
  S_m_sin = 1;
  t = 0:tau:T+i*tau;
  s_sin_gen = @(t) S_m_sin*(sin(2*pi*f*t) + sin(0*2*pi*f*t));
  s_sin = s_sin_gen(t);

  %% FFT
  f_step = Fs/length(t);
  f_fft = -Fs/2:f_step:Fs/2-f_step;
  S_sin_abs = abs(fft(s_sin))/length(f_fft);
  S_sin_abs = fftshift(S_sin_abs);


  %% Plots

  figure(1)
  subplot(2,1,1);
  plot(t,s_sin);

  subplot(2,1,2);
  plot(f_fft, S_sin_abs);
  xlim([-Fs/2 Fs/2-f_step]);
  ylim([0 1]);
      pause(0.1);
end


%% tasks
%
% 1. Create test signals : cosines, AM, FM
% FFT needs many samples
% Multiply long signal of fixed length with a window of a variable length
% 
