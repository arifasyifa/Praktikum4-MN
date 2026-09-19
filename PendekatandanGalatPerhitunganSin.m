clc; clear;

x = 1;
eksak = sin(x);
N_set = [1 2 3 4 5];

printf("Nilai eksak sin(1) = %.16f\n\n", eksak);
printf("%-4s %-20s %-22s %-22s %-12s\n", "N", "Pendekatan", "Error", "Error Relatif", "RPE(%)");

for N = N_set
    hampiran = 0;
    for n = 0:N
        suku = ((-1)^n) * (x^(2*n + 1)) / factorial(2*n + 1);
        hampiran = hampiran + suku;
    end

    err_abs = abs(eksak - hampiran);
    err_rel = err_abs / abs(eksak);
    rpe = err_rel * 100;

    printf("%-4d %-20.16f %-22.16f %-22.16f %-12.8f\n", ...
        N, hampiran, err_abs, err_rel, rpe);
end
