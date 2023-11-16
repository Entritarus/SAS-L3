f = 100;
T = 1/f;

t_b = 16*T;
N = 8192;
tau = t_b/N;
Fs = 1/tau;

t = 0:tau:t_b-tau;
S_m_sin = 1;
s_sin_gen = @(t) S_m_sin*(sin(2*pi*f*t));
s_sin = s_sin_gen(t);

for i = 0:10:N-1
  
  win = [hamming(i)' zeros(1, N-i)];

  %% FFT
  f_step = Fs/length(t);
  f_fft = -Fs/2:f_step:Fs/2-f_step;
  S_sin_abs = abs(fft(s_sin))/length(f_fft);
  S_sin_abs = fftshift(S_sin_abs);

  s_sin_win = s_sin.*win;
  S_sin_win_abs = abs(fft(s_sin_win))/length(f_fft);
  S_sin_win_abs = fftshift(S_sin_win_abs);

  %% Plots

  figure(1)
  subplot(3,1,1);
  plot(t,s_sin);

  subplot(3,1,2);
  plot(f_fft, S_sin_win_abs);
  xlim([-3*f/2 3*f/2-f_step]);
  %ylim([0 1]);

  subplot(3,1,3);
  plot(t, s_sin_win);
end


%% tasks
%
% 1. Create test signals : cosines, AM, FM, BFSK, BASK
% FFT needs many samples
% Multiply long signal of fixed length with a window of a variable length

% 
