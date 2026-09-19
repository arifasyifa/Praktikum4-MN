clc; clear;
x = 0.3;
eksak = exp(x);
n_set = [0 1 2 3 4];

printf("Nilai eksak e^(0.3) = %.16f\n", eksak);
printf("%-4s %-20s %-20s %-22s %-12s\n", "n", "Pendekatan", "Error", "Error Relatif", "RPE(%)");

for n = n_set
    hasil = 0;
    for i = 0:n
        hasil = hasil + x^i / factorial(i);
    end
    err_abs = abs(eksak - hasil);
    err_rel = err_abs / abs(eksak);
    rpe = err_rel * 100;

    printf("%-4d %-20.16f %-20.16f %-22.16f %-12.8f\n", n, hasil, err_abs, err_rel, rpe);
end
