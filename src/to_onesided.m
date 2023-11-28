function onesided = to_onesided(doublesided)
    N = length(doublesided);
    onesided = [doublesided(1) 2*doublesided(2:N/2)];
end