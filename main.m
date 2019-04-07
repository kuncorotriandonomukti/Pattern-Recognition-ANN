clear all, clc;
% Mempersiapkan kamera/webcam
cam = imaqhwinfo;
opsi_kamera = [{'Otomatis'} {'Manual'}]; % 1. Default 2. Pilih
kamera_menu = menu('Pilih pengaturan kamera:',opsi_kamera);
if isempty(kamera_menu) || kamera_menu==0
    Status = ('> Berhenti');
    msgbox({'Tidak ada opsi yang terpilih!'})
    return
end

% Mendapatkan informasi Aquisisi Kamera
[camera_name, camera_id, format] = cvKamera(cam, kamera_menu);

% Mempersiapkan proses video
vid = videoinput(camera_name, camera_id, format);
set(vid, 'FramesPerTrigger', Inf);
set(vid, 'ReturnedColorspace', 'rgb');
% vid.FrameGrabInterval = 10;

start(vid)


% Preprocessing
while(vid.FramesAcquired <= 3000)
    tic,
    % Mendapatkan wcitra per frame
    citra = getsnapshot(vid);
    % citra = imresize(citra, 0.7);
    
    % Konversi Abu
    gray = cvGS(citra,1,1,1);
    
    % Cari citra berwarna Hitam dan Putih saja
    BW = cvFindBW(gray);

    % Pengenalwan Pola
    pola = cvPR(BW);

    % Mengubah outpwut JST menjadi Command
    cvKey(pola);
    
    % Konversi Pola angka menjadi Teks
    polatxt = cvCnv(pola);
    
    % Tampilkan objek yang terdeteksi
    cvFindObj(citra,BW,polatxt);
    toc,
    imshow(BW);
end
% Berhenti merekam
stop(vid);
% Hapus seluruh data
flushdata(vid);