function cvTest(c)
    % Mendapatkan wcitra per frame
    citra = c;
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
end