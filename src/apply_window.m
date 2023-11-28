function sig_out = apply_window(sig_in, win)
%APPLY_WINDOW Applies a window to a signal
    sig_len = length(sig_in);
    win_len = length(win);
    sig_out = [sig_in(1:win_len).*(win') zeros(1, sig_len-win_len)];
end

