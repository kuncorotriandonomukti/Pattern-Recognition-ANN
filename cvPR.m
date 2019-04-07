function pola = cvPR(data)
% Membuat kondisi saat gambar tanpa objek
if data(:,:,:) == 0
    pola = 6; % Nilai random selain kode untuk bentuk pola
else
    % Menggunakan data sebagai citra masukkan
    citra = logical(data);
    citra = bwconvhull(citra,'objects');
    % Mendapatkan nilai Area, Perimeter & Eccentricity
    stats = regionprops(citra,'Area','Perimeter','Eccentricity');
    area = stats.Area;
    perimeter = stats.Perimeter;
    metric = (4*pi*area)./(perimeter.^2);
    eccentricity = stats.Eccentricity;
    
    % Memasukkan data inputan
    input = [metric;eccentricity];
    % Meload variabel net
    load net
    % Mendapatkan Output
    pola = round(sim(net,input));
end
