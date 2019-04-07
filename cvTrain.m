function [Akurasi,Target,output] = cvTrain()
% DATA LATIH
% Bulat = 0
% Segitiga = 3
% Segiempat = 4
% Segilima = 5

% Membaca seluruh Citra sebagai data latih
folder_citra = 'data latih';
namafile = dir(fullfile(folder_citra, '*.gif'));
total_citra = numel(namafile);

% Menentukan jumlah array setiap variabel
area = zeros(1,total_citra);
perimeter = zeros(1,total_citra);
metric = zeros(1,total_citra);
eccentricity = zeros(1,total_citra);

% Preprocessing
for n = 1:total_citra
    nama= fullfile(folder_citra, namafile(n).name);
    citra = logical(imread(nama));
    citra = bwconvhull(citra,'objects');
    % Mendapatakan Area, Perimeter, Eccentricity
    stats = regionprops(citra,'Area','Perimeter','Eccentricity');
    area(n) = stats.Area;
    perimeter(n) = stats.Perimeter;
    % METRIC
    % merupakan nilai perbandingan antara luas  dan keliling objek. 
    % Metric memiliki rentang nilai antara 0 hingga 1. Objek yang berbentuk
    % memanjang/mendekati bentuk garis lurus, nilai metricnya mendekati 
    % angka 0, sedangkan objek yang berbentuk bulat/lingkaran, 
    % nilai metricnya mendekati angka 1.
    metric(n) = 4*pi*area(n)/(perimeter(n)^2);
    % ECCENTRICITY
    % merupakan nilai perbandingan antara jarak foci ellips 
    % minor dengan foci ellips mayor suatu objek. Eccentricity memiliki 
    % rentang nilai antara 0 hingga 1. Objek yang berbentuk memanjang/
    % mendekati bentuk garis lurus, nilai eccentricitynya mendekati angka 1,
    % sedangkan objek yang berbentuk bulat/lingkaran, nilai eccentricitynya
    % mendekati angka 0.
    eccentricity(n) = stats.Eccentricity;
end

% Menentukan masukkan untuk NN
input = [metric;eccentricity];
% Menentukan target untuk NN
target = zeros(1,64);
% Menentukan target file 1 - 16 merupakan 0(Bulat)
target(:,1:16) = 0;
% Menentukan target file 17 - 32 merupakan 3(Segitiga)
target(:,17:32) = 3;
% Menentukan target file 33 - 48 merupakan 4(Segiempat)
target(:,33:48) = 4;
% Menentukan target file 49 - 64 merupakan 5(Segilima)
target(:,49:64) = 5;

% Neural Network
net = newff(input,target,[10 6],{'logsig','logsig'},'trainlm');
net.trainParam.epochs = 100;
net.trainParam.goal = 1e-5;
net = train(net,input,target);
output = round(sim(net,input));

% Menyimpan data NN kedalam file net.mat
save net.mat net

% Menentukan tingkat Akurasi
[m,Target] = find(output==target);
Akurasi = sum(m)/total_citra*100