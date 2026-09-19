clc; clear;

n = 20;

% a. Looping (presisi penuh / double)
val_a = 0;
for k = 1:n
    val_a = val_a + 1/k;
end

% b. Pembulatan per suku (5 desimal)
val_b = 0;
for k = 1:n
    suku = round((1/k) * 1e5) / 1e5;
    val_b = val_b + suku;
end

% c. Tanpa looping (sum vektor)
k_vec = 1:n;
val_c = sum(1 ./ k_vec);

% Perhitungan galat metode b dan c terhadap metode a (eksak)
eksak = val_a;
galat_b = abs(eksak - val_b);
galat_c = abs(eksak - val_c);

% Tampilan ringkasan
printf("a. Looping (eksak double): %.16f\n", val_a);
printf("b. Pembulatan per suku (5 des): %.16f\n", val_b);
printf("c. Tanpa looping (sum vektor): %.16f\n", val_c);
printf("Galat metode b terhadap eksak: %.8f\n", galat_b);
printf("Galat metode c terhadap eksak: %.8f\n\n", galat_c);

% Tampilan tabel galat lengkap
metode_nama = {
    "(a) Looping(double)"
    "(b) Dibulat 5 des"
    "(c) sum vektor"
};
nilai_list = [val_a; val_b; val_c];

printf("%-20s %-20s %-22s %-22s %-10s\n", "Metode", "Nilai", "Error", "Error Relatif", "RPE(%)");

for i = 1:3
    val = nilai_list(i);
    err = abs(eksak - val);
    err_rel = err / abs(eksak);
    rpe = err_rel * 100;

    printf("%-20s %-20.16f %-22.16f %-22.16f %-10.8f\n", ...
        metode_nama{i}, val, err, err_rel, rpe);
end
