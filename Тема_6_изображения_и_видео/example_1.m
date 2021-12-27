% считываение фреймов видео

close all, clear all
%% открываем видео дискриптор

% названеие файла
filename = 'video_2020-12-16 13-18-12.avi'
% видео - дискриптор
v = VideoReader(filename);
%% счиьываение всех фреймов последвоательно 

while hasFrame(v)
    % читаем 1 фрейм
    frame = readFrame(v);
    % выводим на экран
    imshow(frame)
    pause(1) 
end

%% считываение отдельного фрейма
frame = read(v, 300);
imshow(frame)

%% завпись в файлв
%запись
imwrite(frame,'frame_300.png')
% считывание
A = imread('frame_300.png');
% измененеи размерка картинки
J = imresize(A, [480, 600]);
% показать еменьшенный кадр
figure, imshow(J)

%% инфомраця о картинке 

info = imfinfo("frame_300.png")