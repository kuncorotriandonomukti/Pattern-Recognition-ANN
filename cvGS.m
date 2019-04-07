function [CG] = cvGS(C,nr,ng,nb)
% cvGS melakukan proses konversi citra RGB ke Grayscale
% Masukkan :
%   C = Citra yang akan diolah
%   nr = Nilai bobot untuk merah, Bawaan 0.2989
%   ng = Nilai bobot untuk hijau, Bawaan = 0.5870
%   nb = Nilai bobot untuk biru, Bawaan = 0.1140
% Keluaran :
%   CG = Citra Grayscale

[b,k,c] = size(C);
if c<3
    disp('Citra sudah dalam skala Abu')
    return;
end
if nargin < 2
    nr = 0;
    ng = 0;
    nb = 0;
end

% Mempersiapkan proses rgb2g
R = double(C(:,:,1)); % Channel warna Merah
G = double(C(:,:,2)); % Channel warna Hijau
B = double(C(:,:,3)); % Channe; warna Biru

for b = 1:b
    for k = 1:k
        if (nr ~= 0) && (ng~= 0) && (nb~=0)
            % metode 1. Bobot tergantung pengguna
            CG(b,k) = (nr * R(b,k) + ng * G(b,k) + nb * B(b,k))/3;
        else
            % metode 2
            % Rumus berdasarkan kebanyakan Imager processor pada aplikasi
            % (0.2989 * R + 0.5870 * G + 0.1140 * B)/3
            CG(b,k)= (0.2989 * R(b,k) + 0.5870 * G(b,k) + 0.1140 * B(b,k))/3;
        end
    end
    CG = uint8(CG);
end
