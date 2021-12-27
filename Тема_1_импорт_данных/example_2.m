% считывание регулярных файлов вручную

close all; clear all;

%% открытие 
filename = 'nums2.txt';
fid = fopen(filename, 'r');

% проверка - открылся ли файловый дискриптор
if fid > 0
    disp ('OK')
else
    error('ne OK')
end

%% считывание
% количество блоков в файле
nData = fscanf(fid, '%d', 1);
% пустой массив ячеек - размерность 3 на 1 
Data = cell(nData, 1);

% основной циклв
for i = 1 : nData
   % количество строчек с данными
   nLines = fscanf(fid, '%d', 1);
   Data{i} = fscanf(fid, '%f,%f', [2, nLines])'; % считываем кусок размером 2-столбца на nLines-строки
end

fclose (fid);



