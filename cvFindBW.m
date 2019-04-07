function output = cvFindBW(x)
% Mendapatkan Baris, Kolom dan Channel
[b,k,c] = size(x);
% Menyiapkan citra output sesuai dengan uk citra input
output = zeros(b,k);
for i = 1:b
    for j = 1:k
        % Mencari warna hitam pada Channel RGB
        % untuk putih mendekati 255, hitam 0
        if x(i,j) >= 250
            % Jika terdapat warna hitam maka (x,y) akan diberi warna Putih
            output(i,j) = 1;
        else
            % Selain itu bernilai 0
            output(i,j) = 0;
        end
    end
end

