function void = plot_fun(t, sig, fn_os, Tb)
    N = length(t);
    tau = Tb/N;
    Fs = 1/tau;
    
    Tw_vec = [0.1 0.25 0.5 0.75 1.0]*Tb;
    N_Tw = length(Tw_vec);

    f1 = figure(1);
    set(f1, 'Position', [0 0 1280 1000]);
    f2 = figure(2);
    set(f2, 'Position', [0 0 1280 1000]);

    figure(1)
    subplot(N_Tw+1, 1, 1);
    plot(t, sig, 'r-', 'linewidth', 1.2); grid on; grid minor;
    xlabel('t, s');
    ylabel('s(t)');
    set(gca, 'FontSize', 12);

    S_w = abs(fft(sig))/N;
    S_w_os = to_onesided(S_w);

    figure(2)
    plot(fn_os, S_w_os, 'linewidth', 1.2); hold on; grid on; grid minor;
    xlabel('f, Hz');
    ylabel('|S(f)| one-sided');
    set(gca, 'FontSize', 12);



    for i = 1:N_Tw
        Tw = Tw_vec(i);
        Nw = floor(Tw/tau)

        %% window application

        sig_win = apply_window(sig, hamming(Nw));

        %% fft
        S_w_win = abs(fft(sig_win))/N;

        S_w_win_os = to_onesided(S_w_win);

        %% plots
        figure(1)
        subplot(N_Tw+1,1,i+1);
        plot(t, sig_win); grid on; grid minor;
        ylabel(['s(t); T_w = ' num2str(Tw) 'T_b']);
        xlabel('t, s');

        figure(2)
        plot(fn_os, S_w_win_os, 'linewidth', 1.2); 
    end

    figure(2);
    legend({
        'Original spectrum'
        'T_w = 0.10 * Tb',
        'T_w = 0.25 * Tb',
        'T_w = 0.50 * Tb',
        'T_w = 0.75 * Tb',
        'T_w = 1.00 * Tb'
    })
    void = [];
end

