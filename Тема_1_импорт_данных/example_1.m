% работа с файлами начало

clear all; close all;

%% Происходит создание текстового файла и запись данных в него
x = 100*rand(8,1);
fileID = fopen('nums1.txt','w'); % выводит как открыли файл
fprintf(fileID,'%4.4f\n',x);
fclose(fileID);


%% Попробуем считать ранее записанные данные
fileID = fopen('nums1.txt','r');
formatSpec = '%f\n'; % считывание определенного формата файла - спецификация
AA = fscanf(fileID, formatSpec);
fclose(fileID)



