function [pola] = cvCnv(x)
% Konversi Pola angka menjadi Teks
% Bulat = 0 = Kanan
% Segitiga = 3 = Maju
% Segiempat = 4 = Kiri
% Segilima = 5 = Mundur
if x == 0
    pola = 'Bulat'
elseif x == 3
    pola = 'Segitiga'
elseif x == 4
    pola = 'Segiempat'
elseif x == 5
    pola = 'Segilima'
else
    pola = 'Tidak terdeteksi'
end
