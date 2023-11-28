function [t, fn_os] = gen_time_freq_vectors(Tb, N)
% Generates t and fn_os vectors
    tau = Tb/N;

    t = 0:tau:Tb-tau;
    n_os = 0:N/2-1;

    delta_f = 1/Tb;
    fn_os = n_os*delta_f;
end

